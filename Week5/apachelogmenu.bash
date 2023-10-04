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
printf "" > blacklisted.txt
lastTenMin=$((${currentminute}/10))
ipList="clientIPs.txt"
badClient=$(cat "${input}" | egrep 'HTTP/.*" 40[0-4]'| egrep "${currentdate}:${currenthour}:${lastTenMin}[0-9]" | cut -d " " -f1)
blacklist=$(echo "${badClient}" | sort | uniq -c)
echo "${blacklist}" | egrep -v '^[0-2] ' | cut --complement -d " " -f1-7 >> blacklisted.txt
}

#shows number of 200 requests function
function histogram ()
{
cat "${input}" | egrep 'HTTP/.* 200' | cut -d ":" -f1 | cut --complement -d "[" -f1 | uniq -c | awk '{print $1 " visits on " $2}'
}

#blocks blacklisted ips using iptables
function block ()
{
blacklist="blacklisted.txt"
while read -r line
do
   ufw deny from "${line}" to any
done < "${blacklist}"
}

#resets iptables block
function resetblocks()
{
blacklist="blacklisted.txt"
while read -r line
do
   ufw allow from "${line}" to any
done < "${blacklist}"
}

echo "Apache Log Menu:"

#menu loop
userInput="0"
while [[ "${userInput}" -ne "7" ]];
do
  echo "[1] Get Number of Visitors"
  echo "[2] Display Visitors"
  echo "[3] Show Bad Visits"
  echo "[4] Block Bad Visits"
  echo "[5] Reset Block Rules"
  echo "[6] Show Visit Histogram"
  echo "[7] Quit"

  read userInput
  if [[ "${userInput}" -eq "1" ]];
  then
        listIPs
	count=$(wc -l < clientIPs.txt)
	#count in clientIPs.txt
	echo "${count} unique IP Address(es)"
  elif [[ "${userInput}" -eq "2" ]];
  then
        visitors
  elif [[ "${userInput}" -eq "3" ]];
  then
        badClients
	#read through blacklisted.txt
	cat blacklisted.txt
  elif [[ "${userInput}" -eq "4" ]];
  then
        block
	#find rules regarding ips in blacklisted
	while read -r line
	do
	  if [[ "${line}" -ne "" ]];
	  then
		iptables -L | grep "${line}"
	  else
		echo "No bad visitors to block"
	  fi
	done < blacklisted.txt
  elif [[ "${userInput}" -eq "5" ]];
  then
        resetblocks
	iptables -L
  elif [[ "${userInput}" -eq "6" ]];
  then
        histogram
  elif [[ "${userInput}" -eq "7" ]];
  then
	echo "Goodbye!"
  else
        echo "Invalid option entered."
  fi
done

