#!/bin/bash
#This script is setup at /etc/rc.local to run after server boot up, and at interval of 60 seconds

Mail_Sender="azhar@gmail.com"
Mail_Passwd=aXcdx910!
Mail_Receiver="alarm@animapoint.net"
Relay_Host="smtp.gmail.com:587"

while true;
do 
echo "Please find the list of rouge file(s) " | du -a / | sort -n -r | head -n 10000 | sendEmail -f ${Mail_Sender} \
   											         -t ${Mail_Receiver} \
				     						         -u "Alert: Rouge File Spotted" \
									     	         -s "${Relay_Host}" \
										    	       -o tls=yes \
									               -xu "${Mail_Sender}" \
									               -xp "${Mail_Passwd}"
sleep 60;
done
