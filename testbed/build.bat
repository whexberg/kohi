REM Build script for testbed
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

REM echo "Files:" %cFilenames%

SET assembly=testbed
SET compilerFlags=-g 
REM -Wall -Werror
SET includeFlags=-Isrc -I%~dp0/../engine/src/
SET linkerFlags=-L%~dp0/../bin/ -lengine.lib
SET defines=-D_DEBUG -DKIMPORT

ECHO "Building %assembly%%..."
clang %cFilenames% %compilerFlags% -o %~dp0/../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%