#! /bin/sh
. ./run-env.sh
SH_PID_FILE=$PID_DIR/device-server-arbiter.sh.pid
JAVA_PID_FILE=$PID_DIR/device-server-arbiter.java.pid
if [ ! -d $PID_DIR ]; then
	mkdir -p $PID_DIR
fi
if [ -f $JAVA_PID_FILE ]; then
	for PID in `cat $JAVA_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Device server arbiter appears to be running as PID $PID, not starting another instance.
			return
		fi
	done
fi
echo $$ > $SH_PID_FILE
while [ true ]; do
	java -Xmx512m -cp "../../device-arbiter-server/dist/*:../../device-arbiter-server/lib/*" com.kaisquare.arbiter.DeviceServerArbiter --config "../config-arbiter-server.properties" &
        PID=$!
	echo $PID > $JAVA_PID_FILE
	wait $PID
	echo '****************************************'
	echo '***  PROGRAM TERMINATED, RESTARTING  ***'
	echo '****************************************'
done
rm $SH_PID_FILE $JAVA_PID_FILE
