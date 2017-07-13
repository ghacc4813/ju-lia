// This file is a part of Julia. License is MIT: https://julialang.org/license

#define DEBUG_TYPE "combine_muladd"
#undef DEBUG
#include "llvm-version.h"

#include <llvm/IR/Value.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Operator.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Pass.h>
#include <llvm/Support/Debug.h>
#include "fix_llvm_assert.h"

#include "julia.h"

using namespace llvm;

/**
 * Combine
 * ```
 * %v0 = fmul ... %a, %b
 * %v = fadd fast ... %v0, %c
 * ```
 * to
 * `%v = call fast @llvm.fmuladd.<...>(... %a, ... %b, ... %c)`
 * when `%v0` has no other use
 */

struct CombineMulAdd : public FunctionPass {
    static char ID;
    CombineMulAdd() : FunctionPass(ID)
    {}

private:
    bool runOnFunction(Function &F) override;
};

// Return true if this function shouldn't be called again on the other operand
// This will always return false on LLVM 5.0+
static bool checkCombine(Module *m, Instruction *addOp, Value *maybeMul, Value *addend,
                         bool negadd, bool negres)
{
    auto mulOp = dyn_cast<Instruction>(maybeMul);
    if (!mulOp || mulOp->getOpcode() != Instruction::FMul)
        return false;
    if (!mulOp->hasOneUse())
        return false;
#if JL_LLVM_VERSION >= 50000
    // On 5.0+ we only need to mark the mulOp as contract and the backend will do the work for us.
    auto fmf = mulOp->getFastMathFlags();
    fmf.setAllowContract(true);
    mulOp->copyFastMathFlags(fmf);
    return false;
#else
    IRBuilder<> builder(m->getContext());
    builder.SetInsertPoint(addOp);
    auto mul1 = mulOp->getOperand(0);
    auto mul2 = mulOp->getOperand(1);
    Value *muladdf = Intrinsic::getDeclaration(m, Intrinsic::fmuladd, addOp->getType());
    if (negadd) {
        auto newaddend = builder.CreateFNeg(addend);
        // Might be a const
        if (auto neginst = dyn_cast<Instruction>(newaddend))
            neginst->setHasUnsafeAlgebra(true);
        addend = newaddend;
    }
    Instruction *newv = builder.CreateCall(muladdf, {mul1, mul2, addend});
    newv->setHasUnsafeAlgebra(true);
    if (negres) {
        // Shouldn't be a constant
        newv = cast<Instruction>(builder.CreateFNeg(newv));
        newv->setHasUnsafeAlgebra(true);
    }
    addOp->replaceAllUsesWith(newv);
    addOp->eraseFromParent();
    mulOp->eraseFromParent();
    return true;
#endif
}

bool CombineMulAdd::runOnFunction(Function &F)
{
    Module *m = F.getParent();
    for (auto &BB: F) {
        for (auto it = BB.begin(); it != BB.end();) {
            auto &I = *it;
            it++;
            switch (I.getOpcode()) {
            case Instruction::FAdd: {
                if (!I.hasUnsafeAlgebra())
                    continue;
                checkCombine(m, &I, I.getOperand(0), I.getOperand(1), false, false) ||
                    checkCombine(m, &I, I.getOperand(1), I.getOperand(0), false, false);
                break;
            }
            case Instruction::FSub: {
                if (!I.hasUnsafeAlgebra())
                    continue;
                checkCombine(m, &I, I.getOperand(0), I.getOperand(1), true, false) ||
                    checkCombine(m, &I, I.getOperand(1), I.getOperand(0), true, true);
                break;
            }
            default:
                break;
            }
        }
    }
    return true;
}

char CombineMulAdd::ID = 0;
static RegisterPass<CombineMulAdd> X("CombineMulAdd", "Combine mul and add to muladd",
                                     false /* Only looks at CFG */,
                                     false /* Analysis Pass */);

Pass *createCombineMulAddPass()
{
    return new CombineMulAdd();
}
