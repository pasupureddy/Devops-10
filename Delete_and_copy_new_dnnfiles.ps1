#rem: deleting all existing iis dirs
write-host "stopping iss"
iisreset /stop


Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-ttc-EXE\*  -Force -Recurse
Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-aco-EXE\* -Force –recurse
Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-acr-EXE\*  -Force -Recurse
#Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-acr-DEV\* -Force –recurse
#Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-aco-EXE\*  -Force -Recurse
#Remove-Item –path C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-ttc-DEV\* -Force –recurse

#rem: copying new site backups


write-host "Deleted old files now copying backup to site dnn location"

copy-item C:\Devops-Backup\Ansible\CA-RIV-ACO-9.1\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-aco-EXE -Recurse -force
copy-item C:\Devops-Backup\Ansible\CA-RIV-ACR-9.1\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-acr-EXE -Recurse -force
copy-item C:\Devops-Backup\Ansible\CA-RIV-TTC-9.1\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-ttc-EXE -Recurse -force

write-host "copied new backup files to site root location"
#copy-item C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-aco-EXE\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-aco-DEV\ -Recurse -force
#copy-item C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-acr-EXE\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-acr-DEV\ -Recurse -force
#copy-item C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-ttc-EXE\*  C:\inetpub\wwwroot\ca-riv-dnn9-qa-auto-ttc-DEV\ -Recurse 

write-host "restart iss"
iisreset /start
