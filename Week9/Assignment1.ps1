
(Get-NetIPAddress -AddressFamily IPv4 | where { $_.InterfaceAlias -ilike "Ethernet*" }).IPAddress

(Get-NetIPAddress -AddressFamily IPv4 | where { $_.InterfaceAlias -ilike "Ethernet*" }).PrefixLength

Get-WmiObject -List | where {$_.Name -ilike "Win32_[n][e][t]*" } | Sort-Object

Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer | Format-Table -HideTableHeaders

(Get-DnsClientServerAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet*"}).ServerAddresses[0]