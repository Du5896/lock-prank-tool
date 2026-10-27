# 技术文档

## 工作原理

### 锁定流程
1. BAT 请求管理员权限
2. PowerShell 执行 `New-NetFirewallRule` 创建出站阻止规则
3. 规则名称为 `BlockAllBrowsers*`，匹配 Chrome、Edge 等浏览器
4. 浏览器所有出站连接被阻止，无法上网

### 解锁流程
1. BAT 请求管理员权限
2. PowerShell 执行 `Get-NetFirewallRule | Where-Object {$_.DisplayName -like 'BlockAllBrowsers*'} | Remove-NetFirewallRule`
3. 删除所有匹配的防火墙规则
4. 浏览器恢复正常

## 支持的浏览器

- Google Chrome
- Microsoft Edge
- 可扩展添加其他浏览器路径
