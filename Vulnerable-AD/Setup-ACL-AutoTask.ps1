# -----------------------------
# Create folder for scripts
# -----------------------------
$ScriptPath = "C:\Scripts"
If (!(Test-Path $ScriptPath)) {
    New-Item -Path $ScriptPath -ItemType Directory | Out-Null
}

# -----------------------------
# Create the DSACLS execution script
# -----------------------------
$ACLScript = @"
dsacls "CN=Management,CN=Users,DC=sandeep,DC=local" /G "sandeep\sqlsvc:WO"
dsacls "CN=peter,CN=Users,DC=sandeep,DC=local" /G "sandeep\Management:GW"

# Logging
Add-Content -Path "C:\Scripts\acl_log.txt" -Value "$(Get-Date) - DSACLS commands executed"
"@

$ACLScriptPath = "C:\Scripts\Set-ACL.ps1"
$ACLScript | Out-File -FilePath $ACLScriptPath -Encoding UTF8 -Force

# Allow the script to run
Set-ExecutionPolicy Bypass -Force

# -----------------------------
# Create Scheduled Task (Startup + every 3 hours)
# -----------------------------
$Action  = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\Scripts\Set-ACL.ps1"

# Trigger 1 → at system startup
$Trigger1 = New-ScheduledTaskTrigger -AtStartup

# Trigger 2 → every 3 hours, starting at current time
$Now = Get-Date
$Trigger2 = New-ScheduledTaskTrigger -At $Now -Once -RepetitionInterval (New-TimeSpan -Hours 3)

Register-ScheduledTask `
    -TaskName "Update-ACLs" `
    -Action $Action `
    -Trigger $Trigger1,$Trigger2 `
    -RunLevel Highest `
    -Force

Write-Host "Setup Completed. ACL Script + Schedule Task Created Successfully!" -ForegroundColor Green
