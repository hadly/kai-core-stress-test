#! /bin/sh

rate=10

#nohup ../live/h264PlayBack $rate 8555 ../live/test.264 > ./log/h264_server.log 2>&1 & 
#echo "h264 server pid" $!
#echo $! > ./log/h264_server.pid

#cd ../evostreamms/bin/
#nohup ./evostreamms ../config/config.lua > ../../scripts/log/evo_stream.log 2>&1 & 
#echo "evostream pid" $!
#echo $! > ../../scripts/log/evo_stream.pid

#start simulators
sh start-all-kainode-simulators.sh
