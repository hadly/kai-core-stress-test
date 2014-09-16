#! /bin/sh
. ./run-env.sh
SH_PID_FILE=$PID_DIR/device-server-kai-node.sh.pid
CMD_PID_FILE=$PID_DIR/device-server-kai-node.cmd.pid
if [ -f $SH_PID_FILE ]; then
	for PID in `cat $SH_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Killing process $PID.
			kill $PID
		fi
	done
	rm -f $SH_PID_FILE
fi
if [ -f $CMD_PID_FILE ]; then
	for PID in `cat $CMD_PID_FILE`; do
		if [ -e /proc/$PID ]; then
			echo Killing process $PID.
			kill $PID
		fi
	done
	rm -f $CMD_PID_FILE
fi

