iplist=$(bash getips.bash)

echo "${iplist}" | cut -d ":" -f1 | sort | uniq -c | sort -nr
