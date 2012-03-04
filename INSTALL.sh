#!/usr/bin/env bash
#

PWD=`pwd`

echo Creando /etc/ipt/
mkdir -v /etc/ipt/
sleep 1
echo Moviendo fichero de configuracion
cp -v *.conf blacklist reglas /etc/ipt/
sleep 1
echo Moviendo el scrip de inicio
if test -e /etc/init.d/firewall; then
	mv -v /etc/init.d/firewall /etc/init.d/firewall.bk
	cp -v firewall /etc/init.d/
else
	cp -v firewall /etc/init.d/
fi
sleep 1
echo """
	Debian:
	# update-rc.d /etc/init.d/firewall defaults
	o
	# update-rc.d /etc/init.d/firewall start 20 2 3 4 5 . stop 20 0 1 6

	Red-Hat:
	# chkconfig --level 235 /etc/init.d/firewall on

"""
