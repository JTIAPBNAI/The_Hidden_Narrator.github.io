@echo off
:: ==========================================
:: 🚀 AI GHOST WRITING PROJECT SETUP SCRIPT (Windows Launcher)
:: ==========================================

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed or not in your PATH.
    echo Please install Python (https://www.python.org/) to run this setup script and the generated tools.
    pause
    exit /b 1
)

echo 🐍 Launching setup script...
python init_project.py

echo.
pause
