input="activehosts.txt"
printf "" > webservers.txt
while read -r line
do
  goodRequest=$(curl --head "${line}/helloworld.html" | grep "200 OK")
  if [[ "${#goodRequest}" -ge 1 ]];
  then
	echo "${line}" >> webservers.txt
  fi
done < "${input}"
