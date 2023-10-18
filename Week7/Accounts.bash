# User Help Function
Help(){
echo "--------------------------------"
echo "Syntax: ./$0 [- c/d] arg1"
echo "Options:"
echo "-c Counter User Logins"
echo "-d List Disabled Accounts"
echo "-h Display Help"
echo "--------------------------------"
}

#Help for Wrong Arguments
if [[ ! ${#} -eq 1 ]];
then
   echo "${#}"
   Help
   exit;
fi

#Options Loop
while getopts "cd*" option; do
   case "${option}" in
     c) #Count User Logins
	read -r username < usr.txt
   	last | grep "${username}" | cut -d " " -f1 | uniq -c | awk '{print $1 " logins by " $2}'
   	;;
     d) #List Disabled Accounts
	echo "Disabled Accounts:"
   	cat /etc/shadow | grep "*" | cut -d ":" -f1
   	;;
     *) #Display Help
   	Help
   	;;
   esac
done
