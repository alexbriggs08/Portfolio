@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Change to the directory where this script resides
pushd %~dp0

REM Optional usage: push.bat "Your commit message here"
if "%~1"=="" (
  set "MSG=chore: update %date% %time%"
) else (
  set "MSG=%~1"
)

echo --------------------------------------------------
echo Repository status before commit:
git status
echo --------------------------------------------------

REM Stage all changes (new, modified, deleted)
git add -A

REM Commit; if there is nothing to commit, continue without error
git commit -m "!MSG!" || echo Nothing to commit. Skipping commit.

REM Push to origin/main
git push origin main

popd
endlocal
exit /b 0


