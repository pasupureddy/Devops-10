
$Server = '10.0.7.66' 
$Database = 'ca-riv-dnn9-qa-auto-aco-EXE' 
$db1 =  'ca-riv-dnn9-qa-auto-ttc-EXE'
$db2 = 'ca-riv-dnn9-qa-auto-acr-EXE'

$FilePath =  "F:\DevOps_Backup\ansible\aco-dev.bak"
$fp1 =    "F:\DevOps_Backup\ansible\acr-dev.bak"
$fp2 =  "F:\DevOps_Backup\ansible\ttc-dev.bak"
Backup-SqlDatabase -ServerInstance $Server -Database $Database -BackupFile $FilePath
Backup-SqlDatabase -ServerInstance $Server -Database $db1 -BackupFile $fp2
Backup-SqlDatabase -ServerInstance $Server -Database $db2 -BackupFile $fp1
