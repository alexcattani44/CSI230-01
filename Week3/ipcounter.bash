echo "Enter an IP Address: "
read userip
echo "Enter the prefix length: "
read userpl

ip1=$(echo "$userip" | cut -d "." -f1)
ip2=$(echo "$userip" | cut -d "." -f2)
ip3=$(echo "$userip" | cut -d "." -f3)

binIp1=$(echo "obase=2;$ip1" | bc)
binIp2=$(echo "obase=2;$ip2" | bc)
binIp3=$(echo "obase=2;$ip3" | bc)

if [[ "${userpl}" -eq "24" ]];
then
  for i in {1..254}
  do
	host=$(echo "obase=2;$i" | bc)
	printf '%08d' "${binIp1}" >> ipcount.txt
	printf '%08d' "${binIp2}" >> ipcount.txt
	printf '%08d' "${binIp3}" >> ipcount.txt
	printf '%08d\n' "${host}" >> ipcount.txt
  done
elif [[ "${userpl}" -eq "16" ]];
then
  for i in {1..254}
  do
	hostPart1=$(echo "obase=2;$i" | bc)
	for j in {1..254}
	do
	  hostPart2=$(echo "obase=2;$j" | bc)
	  printf '%08d' "${binIp1}" >> ipcount.txt
          printf '%08d' "${binIp2}" >> ipcount.txt
          printf '%08d' "${hostPart1}" >> ipcount.txt
	  printf '%08d\n' "${hostPart2}" >> ipcount.txt
	done
  done
else
  echo "Invalid prefix."

fi
