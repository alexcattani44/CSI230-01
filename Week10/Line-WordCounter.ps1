cd "C:\Users\champuser\Desktop\CSI230-01\"
$FilesToLookAt = Get-ChildItem -Recurse -Filter "*.bash"

for ($i=0; $i -lt $FilesToLookAt.Length; $i++){
Get-Content $FilesToLookAt[$i].FullName | Measure-Object -Line -Word
}