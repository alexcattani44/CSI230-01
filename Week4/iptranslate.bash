echo "Enter an IP Address: "
read userip
echo "Enter the prefix length: "
read userpl

ip1=$(echo "$userip" | cut -d "." -f1)
ip2=$(echo "$userip" | cut -d "." -f2)
ip3=$(echo "$userip" | cut -d "." -f3)

if [[ "${userpl}" -eq "24" ]];
then
  for i in {1..254}
  do
        printf "${ip1}." >> possibleips.txt
        printf "${ip2}." >> possibleips.txt
        printf "${ip3}." >> possibleips.txt
        printf "${i}\n" >> possibleips.txt
  done
elif [[ "${userpl}" -eq "16" ]];
then
  for i in {1..254}
  do
        for j in {1..254}
        do
          printf "${ip1}." >> possibleips.txt
          printf "${ip2}." >> possibleips.txt
	  printf "${i}." >> possibleips.txt
          printf "${j}\n" >> possibleips.txt
        done
  done
  else
  echo "Invalid prefix."

fi


