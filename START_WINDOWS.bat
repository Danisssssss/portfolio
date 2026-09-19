@echo off
cd /d "%~dp0"
where npm >nul 2>&1
if errorlevel 1 (
  echo Node.js is not installed. Open standalone.html instead.
  pause
  exit /b 1
)
if not exist node_modules (
  echo Installing dependencies...
  call npm install
  if errorlevel 1 (
    echo.
    echo Installation failed. You can still open standalone.html directly.
    pause
    exit /b 1
  )
)
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:5173"
call npm run dev -- --host 127.0.0.1
