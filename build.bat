@ECHO OFF

SET SourceFolder=source
SET TempFolder=temp
SET ReleaseFolder=release
SET ModName=@Cargo Manager
SET PublicKeyFile=CargoManager.bikey
SET AddonBuilder=H:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe
SET DSSignFile=H:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\DSSignFile\DSSignFile.exe
SET PrivateKey=D:\Downloads\Games\Arma 3\Keys\CargoManager\CargoManager.biprivatekey

SET BatFolder=%~dp0

REM Initialization.
RMDIR /S /Q %ReleaseFolder%
MKDIR %TempFolder%
MKDIR %ReleaseFolder%

REM Work.
MKDIR "%ReleaseFolder%\%ModName%"
MKDIR "%ReleaseFolder%\%ModName%\Addons"
MKDIR "%ReleaseFolder%\%ModName%\Keys"

REM Stage 1. Copy the static files.
COPY "%SourceFolder%\description\Description.txt" "%ReleaseFolder%\%ModName%\Description.txt"
COPY "%SourceFolder%\images\logo\logo_64x64.paa" "%ReleaseFolder%\%ModName%\logo_64x64.paa"
COPY "%SourceFolder%\images\logo\logo_128x128.paa" "%ReleaseFolder%\%ModName%\logo_128x128.paa"
COPY "%SourceFolder%\code\mod.cpp" "%ReleaseFolder%\%ModName%\mod.cpp"
COPY "%SourceFolder%\public_keys\%PublicKeyFile%" "%ReleaseFolder%\%ModName%\Keys\%PublicKeyFile%"

REM Stage 2. Build the PBO.
ECHO Copying Add-On Sources ...
FOR /f "usebackq delims=|" %%a IN (`dir /b "%SourceFolder%\code\Addons"`) DO (
	xcopy "%SourceFolder%\code\Addons\%%a" "%TempFolder%\%%a" /E /I /V
)

ECHO Packing Add-On Sources ...
FOR /f "usebackq delims=|" %%a IN (`dir /b "%TempFolder%"`) DO (
	ECHO Packing Add-On %%a
	"%AddonBuilder%" "%BatFolder%%TempFolder%\%%a" "%BatFolder%%ReleaseFolder%\%ModName%\Addons" -packonly
)

REM Stage 3. Sign the PBO.
ECHO Signing Add-On PBO Files ...
FOR /f "usebackq delims=|" %%p IN (`dir /b "%BatFolder%%ReleaseFolder%\%ModName%\Addons\*.pbo"`) DO (
	ECHO Signing File %%p
	"%DSSignFile%" "%PrivateKey%" "%BatFolder%%ReleaseFolder%\%ModName%\Addons\%%p"
)

REM Finalization.
RMDIR /S /Q %TempFolder%
