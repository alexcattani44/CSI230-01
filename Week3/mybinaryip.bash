# Gives ip address without prefix in base 2
ip=$(bash getshortip.bash)

ip1=$(echo "$ip" | cut -d "." -f1)
ip2=$(echo "$ip" | cut -d "." -f2)
ip3=$(echo "$ip" | cut -d "." -f3)
ip4=$(echo "$ip" | cut -d "." -f4)

binIp1=$(echo "obase=2;$ip1" | bc)
binIp2=$(echo "obase=2;$ip2" | bc)
binIp3=$(echo "obase=2;$ip3" | bc)
binIp4=$(echo "obase=2;$ip4" | bc)

printf '%08d' "${binIp1}"
printf '%08d' "${binIp2}"
printf '%08d' "${binIp3}"
printf '%08d\n' "${binIp4}"
