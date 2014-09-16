#! /bin/sh
. ./run-env.sh
SH_PID_FILE=$PID_DIR/device-server-kai-node.sh.pid
CMD_PID_FILE=$PID_DIR/device-server-kai-node.cmd.pid
if [ ! -d $PID_DIR ]; then
	mkdir -p $PID_DIR
fi
if [ -f $CMD_PID_FILE ]; then
	for PID in `cat $CMD_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Device server appears to be running as PID $PID, not starting another instance.
			return
		fi
	done
fi
echo $$ > $SH_PID_FILE
echo shell pid is $$
while [ true ]; do
	../../device_server/src/build-linux/device_server ../config-device-server-kai-node.properties &
	PID=$!
	echo $PID > $CMD_PID_FILE
        echo device server pid is $PID
	wait $PID
	echo '****************************************'
	echo '***  PROGRAM TERMINATED, RESTARTING  ***'
	echo '****************************************'
	sleep 20
done
rm $SH_PID_FILE $CMD_PID_FILE

