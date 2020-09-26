#!/bin/bash

echo -n "State of autoindex? (on / off) : "
read INDEX

while [ 1 ]
do
	if [[ "$INDEX" = "on" ]]; then
	    sed -i "s/.*autoindex.*/\tautoindex on;/" /etc/nginx/sites-available/nginx.conf
	    sed -i "s/.*AUTOINDEX.*/export AUTOINDEX=on/" ~/.bashrc
	    break
	elif [[ "$INDEX" = "off" ]]; then
	    sed -i "s/.*autoindex.*/\tautoindex off;/" /etc/nginx/sites-available/nginx.conf
	    sed -i "s/.*AUTOINDEX.*/export AUTOINDEX=off/" ~/.bashrc
	    break
	fi
	echo -n "Wrong state! (on / off) : "
	read INDEX
done

#reload nginx server
nginx -s reload
