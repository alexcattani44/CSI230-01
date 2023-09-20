userInput="0"
while [[ "${userInput}" -ne "6" ]];
do
  echo "Hello!"
  echo "Please select an option:"
  echo "[1] Get My IP Address"
  echo "[2] Get My IP Address in Binary"
  echo "[3] Get My Network Mask in Binary"
  echo "[4] Get My Network Address in Binary"
  echo "[5] Convert Binary to IP Address"
  echo "[6] Quit"

  read userInput
  if [[ "${userInput}" -eq "1" ]];
  then
	x=$(bash getshortip.bash)
  elif [[ "${userInput}" -eq "2" ]];
  then
	x=$(bash mybinaryip.bash)
  elif [[ "${userInput}" -eq "3" ]];
  then
	x=$(bash mymaskbinary.bash)
  elif [[ "${userInput}" -eq "4" ]];
  then
	x=$(bash mynetworkbinary.bash)
  elif [[ "${userInput}" -eq "5" ]];
  then
	echo -n "Please enter your binary number (32 digit): "
	bash bin-ipconvert.bash
  elif [[ "${userInput}" -eq "6" ]];
  then
	echo "Goodbye!"
	x=""
  else
  	echo "Invalid option entered."
	x=""
  fi
  echo "${x}"
done
