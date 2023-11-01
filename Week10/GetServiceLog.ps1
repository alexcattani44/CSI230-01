#Array is used for dynamic ability to modify code
$status=@('All','Running','Stopped')
$readStatus = 0

#reads input from user, 4 terminates program
while($readStatus -ne 4)
{

    Write-Host "Services to View:`n[1] All`n[2] Running`n[3] Stopped`n[4] Quit"

    $readStatus = Read-Host -Prompt "Please Select an Option to View Services"

    #buffer
    sleep 1
    clear

    if ($readStatus -eq 1)
    {
        #shows all statuses of services to show distinction
        Get-Service
        sleep 2
    }
    elseif ($readStatus -eq 2)
    {
        #shows all running services
        Get-Service | where {$_.Status -ilike $status[1]} | select Name, DisplayName
    }
    elseif ($readStatus -eq 3)
    {
        #shows all stopped services
        Get-Service | where {$_.Status -ilike $status[2]} | select Name, DisplayName
    }
    elseif ($readStatus -eq 4)
    {
        #terminates program
        break
    }
    else
    {
        Write-Host "Invalid Option"
    }

}