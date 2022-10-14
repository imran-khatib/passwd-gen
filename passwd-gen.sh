#!/bin/bash
clear
echo "================== Password Generater =================="
echo
echo "1)Random Password. "
echo "2)Manual Password. "
echo "3)AES-256 Encrypted Password."
echo "4)SHA1SUM Encryption."
echo "5)MD5SUM Encryption."
echo 
echo -en "Select the option For Password Generation: "
read option
echo
echo "========================================================"
echo
case "$option" in 
	1)echo "Genrating Random Password..." && sleep 3s
	  echo  "TheGenerated Password is:" &&	pwgen 10 1
	;;
	
	2)echo -en "Enter a Password for encryption:  "	&& sleep 2s
	  	read passwd
	  echo "========================================================"
	  echo	
	  echo  "TheGenerated Password is:" &&	mkpasswd $passwd
	;;

	3)echo -en  "Enter Password For AES-256 encryption: " 
	  read aes

	  echo $aes | openssl enc -aes-256-cbc -a -salt -pass pass:1234
	  echo
	  echo "________________________________________________________"
	  echo
	  echo "The Password is Encrypted With the Key '1234'"	
	;;
	4)echo -en "Enter Password for SHA1SUM Encryption: "
	  read sha1
	  echo $sha1 | sha1sum
	;;  
	5)echo -en  "Enter Password for MD5SUM Encryption: "  
	  read md5
	  echo $md5 | md5sum
	;;
	*)
		echo  "You Have Choosen Wrong Option...Exiting"
	;;
esac
 
exit 0;
