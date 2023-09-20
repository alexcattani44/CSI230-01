flag="valid"
read binarynum

for i in {1..32}
do
   if [[ "${binarynum:${i}-1:1}" -ne "1" && "${binarynum:${i}-1:1}" -ne "0" ]];
   then
	echo "Invalid binary number."
	flag="invalid"
	break

   fi

done

if [[ "${flag}" -eq "valid" ]];
then
   binIp1=$(echo "${binarynum}" | cut -b 1-8)
   binIp2=$(echo "${binarynum}" | cut -b 9-16)
   binIp3=$(echo "${binarynum}" | cut -b 17-24)
   binIp4=$(echo "${binarynum}" | cut -b 25-32)

   myIp1=$((2#"${binIp1}"))
   myIp2=$((2#"${binIp2}"))
   myIp3=$((2#"${binIp3}"))
   myIp4=$((2#"${binIp4}"))

   printf "${myIp1}."
   printf "${myIp2}."
   printf "${myIp3}."
   printf "${myIp4}\n"

fi
