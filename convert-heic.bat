@echo off
setlocal EnableDelayedExpansion
title HEIC to JPG converter
rem Usage: drop this file in the photo folder and double-click it,
rem or drag a folder onto it.
rem Keep this file next to magick.exe.
set "SRC=%~1"
if "%SRC%"=="" set "SRC=%~dp0"
if "%SRC:~-1%"=="\" set "SRC=%SRC:~0,-1%"
set "OUT=%SRC%\converted"

set "TOOL="
set "MAGICK=magick"
if exist "%~dp0magick.exe" set "TOOL=magick" & set "MAGICK=%~dp0magick.exe"
if not defined TOOL where magick >nul 2>&1 && set "TOOL=magick"
if not defined TOOL where ffmpeg >nul 2>&1 && set "TOOL=ffmpeg"
if not defined TOOL (
  echo Neither ImageMagick nor ffmpeg was found.
  echo Install ImageMagick from https://imagemagick.org/script/download.php#windows
  echo and tick "Add application directory to your system path", then run this again.
  pause & exit /b 1
)

if not exist "%OUT%" mkdir "%OUT%"
set /a TOTAL=0
for %%F in ("%SRC%\*.heic" "%SRC%\*.heif") do set /a TOTAL+=1
if %TOTAL%==0 ( echo No HEIC files found in "%SRC%". & pause & exit /b 0 )

echo Converting %TOTAL% photos with %TOOL% into "%OUT%"
set /a N=0, OK=0, SKIP=0, FAIL=0
for %%F in ("%SRC%\*.heic" "%SRC%\*.heif") do (
  set /a N+=1
  set "DST=%OUT%\%%~nF.jpg"
  if exist "!DST!" (
    set /a SKIP+=1
    echo [!N!/%TOTAL%] skip  %%~nxF ^(already converted^)
  ) else (
    if "%TOOL%"=="magick" (
      "!MAGICK!" "%%F" -quality 100 "!DST!" >nul 2>&1
    ) else (
      ffmpeg -hide_banner -loglevel error -i "%%F" -q:v 1 -frames:v 1 "!DST!"
    )
    if exist "!DST!" ( set /a OK+=1 & echo [!N!/%TOTAL%] done  %%~nxF ) else ( set /a FAIL+=1 & echo [!N!/%TOTAL%] FAILED %%~nxF )
  )
)
echo.
echo Finished: %OK% converted, %SKIP% skipped, %FAIL% failed.
echo Your originals were not changed. JPGs are in "%OUT%".
pause
