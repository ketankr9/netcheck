#!/bin/bash
# comment the below line if you are not connected to a proxy server or else modify it accordingly
export http_proxy="http://USERNAME:PASSWORD@SERVERIP:PORT/"

flag="False"
while true
do	
	#below line checks if connection to google.com site is successful(OK).
	wget -q --tries=5 --timeout=20 --spider http://google.com
	if [[ $? -eq 0 ]]; then
		# echo "connected"
		if [[ "$flag" == "False" ]]; then
			#below is the command for ubuntu notification
			notify-send "BHU LAN    :)" "online"
		fi
		flag="True"
	else
		# echo "Disconnected"
		if [[ "$flag" == "True" ]]; then
			#below is the command for ubuntu notification
			notify-send "BHU LAN    :(" "Offline"
		fi
		flag="False"
	fi
	sleep 5
done
