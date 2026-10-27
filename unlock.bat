:: Unlock Computer - Remove Block
@echo off
title 解锁电脑 - 恢复工具
cd /d "%~dp0"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

powershell -NoExit -Command "Get-NetFirewallRule | Where-Object {$_.DisplayName -like 'BlockAllBrowsers*'} | Remove-NetFirewallRule; Write-Host '✅ 已解锁！所有浏览器恢复正常。' -ForegroundColor Green"
