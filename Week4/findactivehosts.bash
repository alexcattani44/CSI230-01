input="possibleips.txt"

while read -r line
do
   tempPing=$(ping "${line}" -c 1) 
   echo "${tempPing}" | grep "PING" | cut -d " " -f2 >> activehosts.txt
done < "${input}"
