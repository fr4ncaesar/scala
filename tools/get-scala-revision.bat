@echo off
rem
rem Usage: get-scala-revison.bat [dir]
rem Figures out current scala revision of a git clone.
rem
rem If no dir is given, current working dir is used.

@setlocal
set _DIR=
if "%*"=="" (
  for /f "delims=;" %%i in ('cd') do set "_DIR=%%i"
) else (
  set "_DIR=%~1"
)
cd %_DIR%

rem  TODO - Look up bat scripting example and fix the darn string.
if exist .git\NUL (
  git describe HEAD --abbrev=7 --match dev
)

rem  Implement something like the following
rem for /f "tokens=1,2,3 delims=- " %%a in ("%gitdescribe%") do set version=%%a&set commits=%%b&set sha=%%c
rem echo %date?%-%commits%-%sha%

:end
@endlocal
