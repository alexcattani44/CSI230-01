logDir="/var/log/apache2/"

allLogs=$(ls "${logDir}" | grep "access.log" | grep -v "other_vhosts" | grep -v "gz")
echo "${allLogs}"

printf "" > access.txt

for i in ${allLogs}
do
   cat "${logDir}${i}" >> access.txt
done

tail access.txt
