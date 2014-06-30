!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "winmessages.nsh"

Name "The Julia Language"
OutFile "julia-installer.exe"
SetCompress off
CRCCheck on
SetDataBlockOptimize on
ShowInstDetails show
RequestExecutionLevel user
BrandingText "Julia ${Version}"

# Add/Remove Programs entry
!define ARP "Software\Microsoft\Windows\CurrentVersion\Uninstall\Julia ${Version}"
!define REG_UNINSTALL "${ARP}"
!define EXE_FILE "bin\julia.exe"
!define DOMAIN "julialang.org"
!define WEBSITE_LINK "http://${DOMAIN}"
!define UNINSTALLER_NAME "Uninstall.exe"

# User interface changes
var Checkbox

# Add the desktop checkbox to the final page.
Function desktopCheckbox
    ${NSD_CreateCheckbox} 120u 130u 100% 10u "Create &desktop shortcut"
    Pop $Checkbox
    SetCtlColors $Checkbox "" "ffffff"
FunctionEnd

# Create the desktop link only, if the desktop checkbox is active.
Function createDesktopLink
    ${NSD_GetState} $Checkbox $0
    ${If} $0 <> 0
        CreateShortCut "$DESKTOP\Julia.lnk" "$INSTDIR\${EXE_FILE}"
    ${EndIf}
FunctionEnd

# Registry related
# Adds the entries that create the icon in the uninstall section of the control panel.
Function addUninstallRegEntriesHKCU
    WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayName" "$(^Name)"
    WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayIcon" "$\"$INSTDIR\${EXE_FILE}$\""
    WriteRegStr HKCU "${REG_UNINSTALL}" "Publisher" "${DOMAIN}"
    WriteRegStr HKCU "${REG_UNINSTALL}" "DisplayVersion" "${Version}"
    WriteRegDWord HKCU "${REG_UNINSTALL}" "EstimatedSize" 383590 ;KB
    WriteRegStr HKCU "${REG_UNINSTALL}" "HelpLink" "${WEBSITE_LINK}"
    WriteRegStr HKCU "${REG_UNINSTALL}" "URLInfoAbout" "${WEBSITE_LINK}"
    WriteRegStr HKCU "${REG_UNINSTALL}" "InstallLocation" "$\"$INSTDIR$\""
    WriteRegStr HKCU "${REG_UNINSTALL}" "InstallSource" "$\"$EXEDIR$\""
    WriteRegDWord HKCU "${REG_UNINSTALL}" "NoModify" 1
    WriteRegDWord HKCU "${REG_UNINSTALL}" "NoRepair" 1
    WriteRegStr HKCU "${REG_UNINSTALL}" "UninstallString" "$\"$INSTDIR\${UNINSTALLER_NAME}$\""
    WriteRegStr HKCU "${REG_UNINSTALL}" "Comments" "Uninstalls $(^Name)"
FunctionEnd

# Adds ARP related entries to HKLM
Function addArpHKCU
    WriteRegStr HKCU "${ARP}" \
                 "DisplayName" "Julia Language ${Version}"
    WriteRegStr HKCU "${ARP}" \
                 "Publisher" "The Julia Project"
    WriteRegStr HKCU "${ARP}" \
                 "DisplayIcon" "$INSTDIR\${EXE_FILE}"
    WriteRegStr HKCU "${ARP}" \
                 "UninstallString" "$\"$INSTDIR\${UNINSTALLER_NAME}$\""
    WriteRegStr HKCU "${ARP}" \
                 "QuietUninstallString" "$\"$INSTDIR\${UNINSTALLER_NAME}$\" /S"
    WriteRegDWORD HKCU "${ARP}" "EstimatedSize" "300"
    WriteRegDWORD HKCU "${ARP}" "NoModify" "1"
    WriteRegDWORD HKCU "${ARP}" "NoRepair" "1"
FunctionEnd

# Icon settings
!define MUI_ICON "contrib\windows\julia.ico"

# Variable definitions used in installer pages
InstallDir "$LOCALAPPDATA\Julia-${Version}"
!define StartMenuFolder "Julia ${Version}"

# Page settings
# Note that we repurpose the checkboxes on the FinishPage
# in order to keep it simple.
!define MUI_DIRECTORYPAGE_TEXT_TOP "Julia may be installed in any accessible directory, including a home folder or portable device. Please run as Administrator to install for system-wide use."
!define MUI_FINISHPAGE_SHOWREADME
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Start Menu folder and shortcut"
!define MUI_FINISHPAGE_SHOWREADME_FUNCTION AddToStartMenu
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Open Julia install folder"
!define MUI_FINISHPAGE_RUN_FUNCTION ShowInstallFolder

# Pages to show
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_PAGE_CUSTOMFUNCTION_SHOW desktopCheckbox
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE createDesktopLink
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Dummy Section" SecDummy
    SetOutPath $INSTDIR
    File /a /r "julia-${Commit}\*"
    WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}"
    CreateShortcut "$INSTDIR\julia.lnk" "$INSTDIR\${EXE_FILE}"

    # ARP entries
    Call addArpHKCU
    
    # Add uninstall icon in the control panel
    Call addUninstallRegEntriesHKCU
    
SectionEnd

Section "uninstall"
    Delete "$INSTDIR\${UNINSTALLER_NAME}"
    Delete "$DESKTOP\Julia.lnk"
    DeleteRegKey HKCU "${ARP}"
    RMDir /r "$SMPROGRAMS\${StartMenuFolder}"
    RMDir /r "$INSTDIR/"
SectionEnd

# Helper function to create Start Menu folder and shortcuts
Function AddToStartMenu
    CreateDirectory "$SMPROGRAMS\${StartMenuFolder}"
    CreateShortcut "$SMPROGRAMS\${StartMenuFolder}\julia.lnk" "$INSTDIR\julia.lnk" "" "" "" "" "" "$(^Name)"
    CreateShortcut "$SMPROGRAMS\${StartMenuFolder}\Uninstall.lnk" "$instdir\${UNINSTALLER_NAME}"
FunctionEnd

# Opens the installation folder
Function ShowInstallFolder
    ExecShell "open" $INSTDIR
FunctionEnd