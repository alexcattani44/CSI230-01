#Set Directory
cd C:\Users\champuser\Desktop\

#Clear screen
clear

#Get Event Log
Get-Eventlog -list

#Ask User Which Logs to Export
$exportLog = Read-host -Prompt "Select a log to export (.csv)"

#Export to a csv file
Get-EventLog -LogName $exportLog -Newest 3 | export-csv -NoTypeInformation -Path "C:\Users\champuser\Desktop\rep.csv"