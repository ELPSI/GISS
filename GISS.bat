@ECHO OFF
CHCP 65001 > NUL
:: File name:	GISS
:: Author:		elpsy
:: Version:		1.0.0
:: Date:		20230405
:: Description	Genshin Impact Server-Switching

CD /D %~DP0 & TITLE GISS - Genshin Impact Server-Switching
SETLOCAL ENABLEDELAYEDEXPANSION
SET "logDate=%DATE:~3,4%%DATE:~8,2%%DATE:~11,2%"
SET "logTime=%TIME:~0,8%"
SET /A successCount=0
SET /A landServerStatus=0
SET /A treeServerStatus=0
SET /A seaServerStatus=0

SET "oldGamePath=0"
SET "oldDataPath=0"
SET "oldDataType=0"
SET "oldServerName=0"
SET "oldGameName=0"
SET "oldServerNum=0"

SET "newGamePath=0"
SET "newDataPath=0"
SET "newDataType=0"
SET "newServerName=0"
SET "newGameName=0"
SET "newServerNum=0"
SET "newPath=0"

SET "gameVersion=0"
SET "oldShortcutName=0"
SET "resourceName=0"
SET "channel=0"
SET "cntInit=0"

CALL :READ_CFG_INI
CALL :INPUT_OLDGAMEPATH
CALL :READ_CONFIG_INI
CALL :JUDGE_SERVER_TYPE
CALL :CHOOSE_SERVER

IF "%newDataType%"=="%oldDataType%" (
	CALL :LAND_TREE
) ELSE (
	CALL :CN_SEA
)
CALL :UPDATECFG
CALL :CREATE_SHORTCUT
ECHO;&ECHO Changed successfully.
PAUSE>NUL & EXIT

:RESET_CFG_VAR
CLS&SET /P "gameVersion=Please input gameVersion(For example:3.5.0),end with inputting "Enter" key: "
SET oldServerNum=0
SET oldGamePath=0
SET oldServerName=0
SET oldDataType=0
SET oldGameName=0
SET successCount=0
GOTO :EOF

:READ_CFG_INI
IF EXIST "cfg\cfg_GICS.ini" (
	FOR /F "TOKENS=1,2 DELIMS==" %%i IN (cfg\cfg_GICS.ini) DO (
		SET %%i=%%j
	)
) ELSE (
	CALL :RESET_CFG_VAR
	SET "cntInit=1"
)
GOTO :EOF

:INPUT_OLDGAMEPATH
ECHO %successCount%|FINDSTR "^[1-9][0-9]*$" > NUL
IF ERRORLEVEL 1	(
	CLS&SET /P "oldGamePath=Please input right old server path: "
)
IF NOT EXIST "%oldGamePath%\mhypbase.dll" (
	IF %cntInit%==0 (
		CALL :RESET_CFG_VAR
		SET cntInit=1
	)
	GOTO INPUT_OLDGAMEPATH
)
GOTO :EOF

:READ_CONFIG_INI
IF EXIST "%temp%\config.ini" (
	DEL /Q "%temp%\config.ini"
)
CD /D "%oldGamePath%"
FOR /F "TOKENS=1,2 DELIMS==" %%i IN (config.ini) DO (
	SET "%%i=%%j"
	ECHO %%i=%%j>>"%temp%\config.ini"
)
IF NOT "%game_version%"=="%gameVersion%" (
	CLS&ECHO [config.ini][General]
	TYPE "%temp%\config.ini"
	ECHO;&ECHO Config.ini error, please fix the game.
	CALL :FAILED_BREAK
)
GOTO :EOF

:JUDGE_SERVER_TYPE
CD /D %~DP0
CALL :INFO
SET /A legalFlag=0
IF EXIST "%oldGamePath%\GenshinImpact.exe" (
	SET "oldServerName=Seaserver"
	SET "oldDataType=GenshinImpact_Data"
	SET "oldGameName=GenshinImpact.exe"
	SET /A oldServerNum=3
	SET /A legalFlag=1
) ELSE (
	IF EXIST "%oldGamePath%\YuanShen.exe" (
		IF %channel%==1 (
			SET "oldServerName=Landserver"
			SET "oldDataType=YuanShen_Data"
			SET "oldGameName=YuanShen.exe"
			SET /A oldServerNum=1
			SET /A legalFlag=1
		) 
		IF %channel%==14 (
			SET "oldServerName=Treeserver"
			SET "oldDataType=YuanShen_Data"
			SET "oldGameName=YuanShen.exe"
			SET /A oldServerNum=2
			SET /A legalFlag=1
		)
	)
)
IF NOT !legalFlag!==1 (
	CALL :FAILED_BREAK
)

SET "oldShortcutName=%oldServerName%"
SET "oldDataPath=%oldGamePath%\%oldDataType%"
IF NOT EXIST "%oldDataPath%" (
	CALL :FAILED_BREAK
)
GOTO :EOF

:CHOOSE_SERVER
SET /A legalFlag=0
CALL :INFO
ECHO;&ECHO Choose new server: [1]Landserver [2]Treeserver [3]Seaserver
ECHO;&SET /P "newServerNum=Input number: "
IF %newServerNum%==%oldServerNum% (
	ECHO %oldServerName% exists.
	GOTO CHOOSE_SERVER
)
IF %newServerNum%==1 (
	SET "newServerName=Landserver"
	SET "resourceName=CNRes_"
	SET "newDataType=YuanShen_Data"
	SET "newGameName=YuanShen.exe"
	SET /A legalFlag=1
)
IF %newServerNum%==2 (
	SET "newServerName=Treeserver"
	SET "resourceName=CNRes_"
	SET "newDataType=YuanShen_Data"
	SET "newGameName=YuanShen.exe"
	SET /A legalFlag=1
)
IF %newServerNum%==3 (
	SET "newServerName=Seaserver"
	SET "resourceName=SeaRes_"
	SET "newDataType=GenshinImpact_Data"
	SET "newGameName=GenshinImpact.exe"
	SET /A legalFlag=1
)
IF NOT %legalFlag%==1 (
	GOTO CHOOSE_SERVER
)
SET "newGamePath=%oldGamePath%"
SET "newDataPath=%newGamePath%\%newDataType%"
GOTO :EOF

:INFO
CLS
ECHO Game path: %oldGamePath%
ECHO;&ECHO Old server: [%oldServerNum%]%oldServerName%
ECHO %newServerNum%|FINDSTR "^[1-3][0-9]*$" > NUL
IF NOT %newServerName%==0 (
	ECHO;&ECHO New server: [%newServerNum%]%newServerName%
)
rem ECHO %newServerNum%|FINDSTR "^[1-3][0-9]*$" > NUL
rem IF NOT ERRORLEVEL 1 (
rem 	ECHO;&ECHO New server: [%newServerNum%]%newServerName%.
rem )
GOTO :EOF

:CN_SEA
CALL :INFO
IF EXIST "%resourceName%V%gameVersion%" (
	REN "%oldDataPath%" "%newDataType%"
	IF ERRORLEVEL 1 (
		ECHO;&ECHO Please exit the game and close game folder.
		ECHO;&PAUSE
		GOTO CN_SEA
	)
	XCOPY /E /Y "%resourceName%V%gameVersion%\" "%newGamePath%">NUL 2>NUL
	IF ERRORLEVEL 1 (
		CALL FAILED_BREAK
	)
	CALL :COPY_TREESDK
) ELSE (
	IF NOT EXIST "%resourceName%V%gameVersion%.exe" (
		ECHO;&ECHO Please download %resourceName%V%gameVersion%.exe to this folder.
		ECHO;&PAUSE
		GOTO CN_SEA
	)
	"%resourceName%V%gameVersion%.exe"
)
	IF EXIST "%oldGamePath%\%oldGameName%" (
		DEL /Q "%oldGamePath%\%oldGameName%"
	)
GOTO :EOF

:LAND_TREE
CALL :COPY_TREESDK
GOTO :EOF

:COPY_TREESDK
CALL :INFO
IF %newServerNum%==2 (
	IF EXIST "PCGameSDK.dll" (
		COPY /Y "PCGameSDK.dll" "%newDataPath%\Plugins\PCGameSDK.dll">NUL 2>NUL
	) ELSE (
		ECHO;&ECHO Please download PCGameSDK.dll.
		ECHO;&PAUSE
		GOTO COPY_TREESDK
	)
) ELSE (
	IF EXIST "%newDataPath%\Plugins\PCGameSDK.dll" (
		DEL /Q "%newDataPath%\Plugins\PCGameSDK.dll"
		IF ERRORLEVEL 1 (
			ECHO;&ECHO Please exit the game and close game folder.
			ECHO;&PAUSE
			GOTO COPY_TREESDK
		)
	)
)
GOTO :EOF

:UPDATECFG
CALL :INFO
IF %newServerName%==Landserver (
	SET /A "landServerStatus=1"
	SET /A "treeServerStatus=0"
	SET /A "seaServerStatus=0"
	SET "channel=1"
	SET "cps=mihoyo"
) ELSE (
	IF %newServerName%==Treeserver (
		SET /A "landServerStatus=0"
		SET /A "treeServerStatus=1"
		SET /A "seaServerStatus=0"
		SET "channel=14"
		SET "cps=bilibili"
	) ELSE (
		IF %newServerName%==Seaserver (
			SET /A "landServerStatus=0"
			SET /A "treeServerStatus=0"
			SET /A "seaServerStatus=1"
			SET "channel=1"
			SET "cps=mihoyo"
		)
	)
)
CD /D %~DP0
IF NOT EXIST "cfg" (
	MD "cfg"
)
(
	ECHO channel=%channel%
	ECHO cps=%cps%
	ECHO game_version=%gameVersion%
	ECHO sub_channel=%sub_channel%
)>"%newGamePath%\config.ini"
SET /A "successCount+=1"
(
	ECHO gameVersion=%gameVersion%
	ECHO oldServerNum=%newServerNum%
	ECHO oldGamePath=%newGamePath%
	ECHO oldServerName=%newServerName%
	ECHO oldDataType=%newDataType%
	ECHO oldGameName=%newGameName%
	ECHO successCount=%successCount%

)>cfg\cfg_GICS.ini
GOTO :EOF

:CREATE_SHORTCUT
SET "shortcutName=%newServerName%"
FOR /F "SKIP=2 TOKENS=1,2 DELIMS=:" %%i IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Desktop"') DO (
	SET "value1=%%i"
	SET "value2=%%j"
	SET "desktopPath=!value1:~-1!:!value2!"
)
IF EXIST "!desktopPath!\%oldShortcutName%.lnk" (
	DEL /Q "!desktopPath!\%oldShortcutName%.lnk"
)
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\%shortcutName%.lnk""):b.TargetPath=""%newGamePath%\%newGameName%"":b.WorkingDirectory=""%newGamePath%"":b.Save:close")
GOTO :EOF

:FAILED_BREAK
ECHO;&ECHO Failed to create server, press any key to exit.
PAUSE>NUL && exit