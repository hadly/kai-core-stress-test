#! /bin/sh
. ./run-env.sh
mkdir -p $LOG_DIR
mkdir -p $PID_DIR
if [ ! -d $LOG_DIR ]; then
    echo Log directory cannot be created.
      return
    fi
    TIME=`date '+%Y%m%d-%H%M%S'`
#    nohup ./run-play-server.sh > $LOG_DIR/$TIME-juzz4web.log 2>&1 &
    nohup ./run-device-server-arbiter.sh > $LOG_DIR/arbiter-server.log 2>&1 &
#    nohup ./run-video-recorder.sh > $LOG_DIR/$TIME-video-recorder.log 2>&1 &

