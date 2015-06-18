#!/bin/sh
echo "\033[32m\033[1;37mEnable vhosts\033[0m"
cd /etc/apache2/sites-available
for f in *;
do
	if [ "$f" != "000-default.conf" ]; then
    	a2ensite "$f"
	fi;
done
echo "\033[32m\033[1;37mRestart apache\033[0m"
/usr/sbin/apache2ctl -D FOREGROUND