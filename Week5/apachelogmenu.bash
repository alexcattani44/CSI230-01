input="/var/log/apache2/access.log"
currentdate=$(date +"%d/%b/%Y")
currenthour=$(date +"%H")
currentminute=$(date +"%M")

#list IPs who accessed webpage function
function listIPs ()
{

printf "" > clientIPs.txt
ipList=""
ipList=$(cat "${input}" | cut -d " " -f1)
echo "${ipList}" | sort | uniq >> clientIPs.txt

}

# counts how many times visitors accessed function
function visitors ()
{

ipList="clientIPs.txt"
visitor=$(cat "${ipList}" | cat "${input}" | grep "${currentdate}" | cut -d " " -f1)

echo "${visitor}" | sort | uniq -c | sort -nr

}

#add bad clients to blacklisted.txt
function badClients ()
{
lastTenMin=$((${currentminute}/10))
ipList="clientIPs.txt"
badClient=$(cat "${input}" | egrep 'HTTP/.*" 40[0-4]'| egrep "${currentdate}:${currenthour}:${lastTenMin}[0-9]" | cut -d " " -f1)
echo "${badClient}" | sort | uniq -c
}

#shows number of 200 requests function
function histogram ()
{
echo
}

#blocks blacklisted ips using iptables
function block ()
{
echo
}

#resets iptables block
function resetblocks()
{
echo
}

#menu loop
#listIPs
#visitors
badClients
