:: Lock Computer - Block Browsers
@echo off
title 锁定电脑 - 恶作剧工具
cd /d "%~dp0"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

powershell -NoExit -Command "New-NetFirewallRule -DisplayName 'BlockAllBrowsers' -Direction Outbound -Program 'C:\Program Files\Google\Chrome\Application\chrome.exe' -Action Block; New-NetFirewallRule -DisplayName 'BlockAllBrowsers' -Direction Outbound -Program 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' -Action Block; Write-Host '✅ 已锁定！所有浏览器无法上网。' -ForegroundColor Red; Write-Host '🔓 运行 unlock.bat 可恢复' -ForegroundColor Yellow"
