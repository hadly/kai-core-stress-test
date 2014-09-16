#! /bin/sh
. ./stress-test.conf

#stop all services
sh stop-arbiter.sh
sh stop-ds-h264.sh
echo "----all services stopped"



#config all variables
sh config-arbiter.sh
sh config-h264.sh
sh config-ds.sh
echo "----all services configured successfully"


echo "----sleep 5 seconds before start services:"
sleep 5
#start all services
sh start-arbiter.sh
sh start-ds-h264.sh
echo "----all services started"



