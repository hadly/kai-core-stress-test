#! /bin/sh
. ./run-env.sh
mkdir -p $PID_DIR
mkdir -p $LOG_DIR
if [ ! -d $LOG_DIR ]; then
	echo Log directory cannot be created.
	return
fi
TIME=`date '+%Y%m%d-%H%M%S'`
#nohup ./run-device-server-dahua-ipc.sh > $LOG_DIR/$TIME-device-server-dahua-ipc.log 2>&1 &
#nohup ./run-device-server-dahua-dvr-4.sh > $LOG_DIR/$TIME-device-server-dahua-dvr-4.log 2>&1 &
#nohup ./run-device-server-amegia-ipc.sh > $LOG_DIR/$TIME-device-server-amegia-ipc.log 2>&1 &
#nohup ./run-device-simulator.sh > $LOG_DIR/$TIME-device-simlulator.log 2>&1 &
#nohup ./run-device-server-simulator.sh > $LOG_DIR/$TIME-device-server-simlulator.log 2>&1 &
#nohup ./run-register-server-atracker.sh > $LOG_DIR/$TIME-device-register-server-atracker.log 2>&1 &
#nohup ./run-device-server-atracker.sh > $LOG_DIR/$TIME-device-server-atracker.log 2>&1 &
#nohup ./run-device-server-vivotek-ipc.sh > $LOG_DIR/$TIME-device-server-vivotek-ipc.log 2>&1 &
#nohup ./run-device-server-axis-ipc.sh > $LOG_DIR/$TIME-device-server-axis-ipc.log 2>&1 &
#nohup ./run-device-server-amtk-ipc.sh > $LOG_DIR/$TIME-device-server-amtk-ipc.log 2>&1 &
#nohup ./run-device-server-etrovision-ipc.sh > $LOG_DIR/$TIME-device-server-etrovision-ipc.log 2>&1 &
#nohup ./run-device-server-messoa-ipc.sh > $LOG_DIR/$TIME-device-server-messoa-ipc.log 2>&1 &
nohup ./run-device-server-kai-node.sh > $LOG_DIR/$TIME-device-server-kai-node.log 2>&1 &

#nohup ./run-device-server-general-rtsp-ipc.sh > $LOG_DIR/$TIME-device-server-general-rtsp.log 2>&1 &


