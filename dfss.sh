#!/bin/bash
#
# Daemon for sense of security
# Author: coffnix
# https://github.com/area31/dfss
#

CONFIG_FILE="${0}.conf"

## Variáveis ##
source ${CONFIG_FILE}

## Funções ##

{
if ! flock -n 666; then
	exit 1
else

	echo 1 > /proc/sys/kernel/sysrq

while [ 1 ]; do
	CHECK_USB=$(lsusb|grep "${ID_VENDOR}:${ID_PRODUCT}"|wc -l)
	if [ "${CHECK_USB}" -ne "0" ]; then
		echo ${MSG_CONNECTED} > /dev/null
	else
		CHECK_USB=$(lsusb|grep "${ID_VENDOR}:${ID_PRODUCT}"|wc -l)
		if [ "${CHECK_USB}" -ne "0" ]; then
			echo ${MSG_CONNECTED} > /dev/null
		else
			data_hora() { echo "[$(date +'%d/%m/%Y') $(date +'%H:%M:%S')]"; }
			if [ "${CHOICE_DISCONNECTED}" = "reboot" ]; then
				## Reboot
				echo b > /proc/sysrq-trigger
			elif [ "${CHOICE_DISCONNECTED}" = "shutdown" ]; then
				## Shutdown
					echo -e "$(data_hora)  ${DAEMON_NAME}: ${MSG_DISCONNECTED}... ${MSG_EXITING}\n" >> ${LOG}
				echo o > /proc/sysrq-trigger
			fi
		fi
	fi
	
	# Intervalo
	sleep ${INTERVALO_SEGUNDOS}
done

fi

} 666>${LOCK};rm ${LOCK}
