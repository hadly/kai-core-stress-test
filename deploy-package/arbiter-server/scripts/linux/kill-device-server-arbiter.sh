#! /bin/sh
. ./run-env.sh
SH_PID_FILE=$PID_DIR/device-server-arbiter.sh.pid
JAVA_PID_FILE=$PID_DIR/device-server-arbiter.java.pid
if [ -f $SH_PID_FILE ]; then
	for PID in `cat $SH_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Killing process $PID.
			kill $PID
		fi
	done
	rm -f $SH_PID_FILE
fi
if [ -f $JAVA_PID_FILE ]; then
	for PID in `cat $JAVA_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Killing process $PID.
			kill $PID
		fi
	done
	rm -f $JAVA_PID_FILE
fi
