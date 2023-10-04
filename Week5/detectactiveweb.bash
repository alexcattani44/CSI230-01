input="activehosts.txt"
printf "" > webservers.txt
while read -r line
do
  goodRequest=$(curl --head "${line}"/helloworld.html | egrep 'HTTP/.* 200' | cut -d "2" -f1)
  if [[ "${goodRequest}" -eq "2" ]];
  then
	echo "${line}" >> webservers.txt
  fi
done < "${input}"
