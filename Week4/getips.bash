input="/var/log/apache2/access.log"

while read -r line
do
  currentdate=$(date +"%d/%b/%Y")
  echo "${line}" | grep "${currentdate}" | cut -d "-" -f1-3
done < "${input}"
