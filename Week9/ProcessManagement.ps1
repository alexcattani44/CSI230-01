#$day=(Get-Date -Format "MM/dd/yyyy")

#1
#Get-Process | select StartTime, ProcessName | where { $_.ProcessName -ilike "C*"  } | where { $_.StartTime -ilike "$day 1[1-2]:*" }

#2
#Get-Process | select ProcessName, Path | where { $_.Path -inotlike "system32*" }

#3
#Get-Service | where { $_.Status -ilike "Stopped" } | Sort-Object | Export-Csv -Path "C:\Users\champuser\Desktop\CSI230-01\week9\outfolder\stopped_services.csv"

#4
#Get-ChildItem -Recurse -File | where {$_.Extension -ilike ".ps1*" } | Sort-Object CreationTime

#5
#Get-ChildItem -Recurse | select Name, CreationTime | where { $_.CreationTime -ilike "10/2[4-9]/2023*" } | ` 
#Export-Csv -Path "C:\Users\champuser\Desktop\CSI230-01\week9\outfolder\new_files.csv" | Format-Table -HideTableHeaders

#6
if (Get-Process chrome) `
{ Stop-Process -Name "chrome" } `
else `
{ Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList '"http://www.champlain.edu"' }
