@test broadcast(+, eye(2), [1, 4]) == [2 1; 4 5]
@test broadcast(+, eye(2), [1  4]) == [2 4; 1 5]
@test broadcast(+, [1  0], [1, 4]) == [2 1; 5 4]
@test broadcast(+, [1, 0], [1  4]) == [2 5; 1 4]
@test broadcast(+, [1, 0], [1, 4]) == [2, 4]

@test eye(2) .+ [1, 4] == [2 1; 4 5]
@test eye(2) .+ [1  4] == [2 4; 1 5]
@test [1  0] .+ [1, 4] == [2 1; 5 4]
@test [1, 0] .+ [1  4] == [2 5; 1 4]
@test [1, 0] .+ [1, 4] == [2, 4]
@test [1] .+ [] == []

M = [11 12; 21 22]
@test broadcast_getindex(M, eye(2)+1,[1, 2]) == [21 11; 12 22]
A = zeros(2,2); broadcast_setindex!(A, [21 11; 12 22], eye(2)+1,[1, 2])
@test A == M
