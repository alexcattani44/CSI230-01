cd "C:\Users\champuser\Desktop\CSI230-01\Week9"

#List based on file name
$files=(Get-ChildItem)
for($j=0; $j -le $files.length; $j++){

    if($files[$j].FullName -ilike "*ps1"){
        $files[$j].BaseName+$files[$j].Extension
    }
}

#Create Folder if it does not exist
$folderPath = "C:\Users\champuser\Desktop\CSI230-01\week9\outfolder"
if (Test-Path $folderPath){
    Write-Host "Folder Already Exists"
}
else{
    New-Item -ItemType Directory -Path $folderPath
}

cd "C:\Users\champuser\Desktop\CSI230-01\Week9"

$filePath = Join-Path $folderPath "out.csv"
$files | Where-Object { $_.FullName -ilike ".ps1" } | `
Export-Csv -Path $filePath

$files=(Get-ChildItem -Recurse -File)
$files | Rename-Item -NewName { $_.Name -replace '.csv', '.log' }
Get-ChildItem -Recurse -File