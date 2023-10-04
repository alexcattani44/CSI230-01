log="access.txt"

#refreshes page when run
printf "" > ipLog.html

printf "<html>\n<body>\n<table>\n" >> ipLog.html

printf "<tr>\n\t<td>IP</td>\n\t<td>Time</td>\n\t<td>RequestedPage</td>\n\t<td>UserAgent</td>\n</tr>" >> ipLog.html

#loop
while read -r line
do
	ip=$(echo "${line}" | cut -d " " -f1)
	times=$(echo "${line}" | cut -d " " -f4)
	page=$(echo "${line}" | cut -d " " -f7)
	agent=$(echo "${line}" | cut -d " " -f12)
	printf "<tr>\n\t<td>${ip}</td>\n\t<td>${times}</td>\n\t<td>${page}</td>\n\t<td>${agent}</td>\n</tr>" >> ipLog.html

done < "${log}"

printf "</table>\n</body>\n<html>" >> ipLog.html

cp ipLog.html /var/www/html
