iisreset /stop

import-module sqlps
$dt = Get-Date -Format yyyyMMddHHmmss
$dbname = 'ca-riv-dnn9-qa-auto-aco-EXE'
Restore-SqlDatabase -ServerInstance 10.0.7.66 -Database $dbname -BackupFile "F:\DevOps_Backup\ansible\aco-exe.bak" 
write-host "aco restoration is done"

$dbname1= 'ca-riv-dnn9-qa-auto-acr-EXE'
Restore-SqlDatabase -ServerInstance 10.0.7.66 -Database $dbname1 -BackupFile "F:\DevOps_Backup\ansible\acr-exe.bak"
write-host "acr restorations is done"

$dbname2= 'ca-riv-dnn9-qa-auto-ttc-EXE'
Restore-SqlDatabase -ServerInstance 10.0.7.66 -Database $dbname2 -BackupFile "F:\DevOps_Backup\ansible\ttc-exe.bak" -ReplaceDatabase 
write-host "ttc restoration is done"

iisreset /start
