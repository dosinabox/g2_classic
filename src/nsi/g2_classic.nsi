###################################
##      Подключенные хидеры      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            Основное           ##
###################################

!define MOD_VERSION "1.6"
!define MOD_DATE "8.1"
!define MOD_NAME_SYS "g2_classic"
!define MOD_NAME_RU "Готика 2: Классическая"
!define MOD_AUTHOR "D36, Kor Angar"
!define MOD_LINK "https://worldofplayers.ru/threads/41796"
!define MOD_SIZE "170000"
!define MOD_HEADER "logo.bmp"
!define MOD_PIC "pic.bmp"

!define MOD_DETAILED_VERSION "${MOD_VERSION}.${MOD_DATE}"
!define INSTALLER_NAME "${MOD_NAME_SYS}_v${MOD_VERSION}_install"
!define UNINSTALLER_NAME "${MOD_NAME_SYS}_uninstall"
!define REGISTRY_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}"

Name "${MOD_NAME_SYS}_v${MOD_VERSION}"
OutFile "${INSTALLER_NAME}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${INSTALLER_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME_RU}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

Unicode true
SetCompressor lzma

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "${MOD_NAME_SYS}.ico"
!define MUI_UNICON "${MOD_NAME_SYS}.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${MOD_HEADER}"
!define MUI_HEADERIMAGE_UNBITMAP "${MOD_HEADER}"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${MOD_PIC}"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${MOD_PIC}"

Caption "${MOD_NAME_RU} (v${MOD_VERSION}) - установка"
!define MUI_TEXT_WELCOME_INFO_TITLE " "
!define MUI_TEXT_WELCOME_INFO_TEXT "Данная модификация позволит вам запускать оригинальную Готику 2 без аддона 'Ночь Ворона'. Установка рекомендуется на русскую версию Золотого Издания от Акеллы с установленным Player Kit. Сохранения из игры с аддоном не поддерживаются: начало новой игры обязательно!"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "Программа установит модификацию в указанную папку.$\n$\nЧтобы установить модификацию в другую папку, нажмите кнопку 'Обзор ...' и укажите ее. Если кнопка 'Установить' остается неактивной, то сначала установите Player Kit (официальный набор для запуска модов)."

!define MUI_COMPONENTSPAGE_NODESC
SpaceTexts none

!define MUI_TEXT_INSTALLING_TITLE "Копирование файлов..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tУстановка завершена!"
!define MUI_TEXT_FINISH_INFO_TEXT "Приятной игры! Нажмите кнопку 'Готово' для завершения."

UninstallCaption "${MOD_NAME_RU} - удаление"

!define MUI_UNTEXT_COMPONENTS_TITLE "Выбор компонентов для удаления"
!define MUI_UNTEXT_COMPONENTS_SUBTITLE " "

!define MUI_UNTEXT_FINISH_INFO_TITLE " "
!define MUI_UNTEXT_FINISH_INFO_TEXT "Все выбранные компоненты модификации удалены из папки с игрой. Нажмите кнопку 'Готово' для завершения."

BrandingText " "

###################################
##     Страницы  инсталлятора    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##    Страницы  деинсталлятора   ##
###################################

!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты модификации, которые вы хотите удалить. Нажмите кнопку 'Удалить' для продолжения."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для удаления:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##          Инсталляция          ##
###################################

Section "Основные файлы" SecMain
	SectionIn RO
	CreateDirectory "$INSTDIR\saves_${MOD_NAME_SYS}\current"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "${MOD_NAME_SYS}.mod"
	File "${MOD_NAME_SYS}_ru.mod"

	SetOutPath "$INSTDIR\system"
	File "${MOD_NAME_SYS}.ico"
	File "${MOD_NAME_SYS}.ini"
	File "${MOD_NAME_SYS}.rtf"

	SetOutPath "$INSTDIR\_work\Data\Video"
	File "${MOD_NAME_SYS}_credits.bik"

	SetOutPath $INSTDIR
	File "${MOD_NAME_SYS}_readme.txt"

	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"

	WriteRegStr HKCU "Software\${MOD_NAME_SYS}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayName" "${MOD_NAME_RU} (v${MOD_VERSION})"
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayVersion" "${MOD_DETAILED_VERSION}"
	WriteRegStr HKLM "${REGISTRY_PATH}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "${REGISTRY_PATH}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "${REGISTRY_PATH}" "HelpLink" "${MOD_LINK}"
	WriteRegStr HKLM "${REGISTRY_PATH}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "${REGISTRY_PATH}" "DisplayIcon" "$INSTDIR\system\${MOD_NAME_SYS}.ico"
	WriteRegDWORD HKLM "${REGISTRY_PATH}" "EstimatedSize" "${MOD_SIZE}"
SectionEnd

###################################
##         Деинсталляция         ##
###################################

Section "Un.Удалить модификацию" SecUninstall_Main
	SectionIn RO
	Delete "$INSTDIR\${MOD_NAME_SYS}_readme.txt"
	Delete "$INSTDIR\system\${MOD_NAME_SYS}.ico"
	Delete "$INSTDIR\system\${MOD_NAME_SYS}.ini"
	Delete "$INSTDIR\system\${MOD_NAME_SYS}.rtf"
	Delete "$INSTDIR\Data\ModVDF\${MOD_NAME_SYS}.mod"
	Delete "$INSTDIR\Data\ModVDF\${MOD_NAME_SYS}_ru.mod"
	Delete "$INSTDIR\Data\ModVDF\${MOD_NAME_SYS}_hotfix.mod"
	Delete "$INSTDIR\_work\Data\Video\${MOD_NAME_SYS}_credits.bik"
	Delete "$INSTDIR\_work\Data\Video\${MOD_NAME_SYS}_credits2.bik"
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "${REGISTRY_PATH}"
SectionEnd

Section /o "Un.Удалить сохранения" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_${MOD_NAME_SYS}"
SectionEnd

###################################
##            Функции            ##
###################################

Function .onInit
	SetSilent normal
	!insertmacro MUI_LANGDLL_DISPLAY
	ReadRegStr $INSTDIR HKCU "Software\${MOD_NAME_SYS}" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	StrCpy $INSTDIR "$PROGRAMFILES\Akella Games\Gothic II"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\GothicStarter.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd
