@echo off
setlocal

REM =============================================================
REM  build.bat - One-click build for LaTeX thesis project
REM =============================================================

REM Output directory for converted assets (EPS→PDF, SVG→PDF/PNG)
set "OUTDIR=figures-converted"

REM Ensure output directory exists
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

echo Checking for Inkscape (optional, for SVG conversion)...
where inkscape >nul 2>&1
if errorlevel 1 (
  echo Inkscape not found on PATH. SVGs may not convert; vector/PNG fallbacks depend on your TeX setup.
) else (
  echo Inkscape found.
)

echo Running pdflatex (1st pass: aux files, conversions)...
pdflatex -shell-escape -halt-on-error -interaction=nonstopmode main.tex || goto :error

echo Generating glossaries and acronyms...
makeglossaries main || goto :error

echo Generating bibliography...
biber main || goto :error

echo Running pdflatex (2nd pass: glossaries, bib)...
pdflatex -shell-escape -halt-on-error -interaction=nonstopmode main.tex || goto :error

echo Running pdflatex (final pass: cross-references)...
pdflatex -shell-escape -halt-on-error -interaction=nonstopmode main.tex || goto :error

echo.
echo Build completed successfully!
goto :eof

:error
echo.
echo Build failed! Check the log above for errors.
pause
endlocal
goto :eof