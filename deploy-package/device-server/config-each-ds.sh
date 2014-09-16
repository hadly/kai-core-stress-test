. ./stress-test.conf
#which one is this ds on this server,such as 1st\2nd
dsOrder=$1
serverIdBegin=$2


#set server-id
#if there is only one ds machine,we set serverId from 1001,
#if more than one ds machine,we can set the 2nd one to 2001
serverId=$serverIdBegin$dsOrder
sed -i "s/server-id=.*/server-id=$serverId/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#server-host
sed -i "4s/server-host=.*/server-host=$dsHostOfThisMachine/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#server-port
sed -i "s/server-port=.*/server-port=`expr $serverPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#http-port
sed -i "s/http-port=.*/http-port=`expr $httpPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#rtsp-port
sed -i "s/rtsp-port=.*/rtsp-port=`expr $rtspPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#register-host & data-receiver-host
#sed -i "s/register-host=.*/register-host=$arbiterHost/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties
#sed -i "s/data-receiver-host=.*/data-receiver-host=$arbiterHost/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties
sed -i "s/arbiter-server-host=.*/arbiter-server-host=$arbiterHost/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#recording-management-host
#sed -i "s/recording-management-host=.*/recording-management-host=localhost/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#server-recording-port
#sed -i "s/server-recording-port=.*/server-recording-port=`expr $serverRecordingPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#server-data-publish-port
sed -i "s/server-data-publish-port=.*/server-data-publish-port=`expr $serverDataPublishPort + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#h264-server-host
#sed -i "s/h264-server-host=.*/h264-server-host=rtsp:\/\/$h264Host:5544\/demo/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#max-devices-supported
#sed -i "s/max-devices-supported=.*/max-devices-supported=$eachDsDeviceNum/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

 
#kainode-video-port
#sed -i "s/kainode-video-port=.*/kainode-video-port=`expr $kainodeVideoPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#kainode-info-port
#sed -i "s/kainode-info-port=.*/kainode-info-port=`expr $kainodeInfoPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties

#Node stream listen port
sed -i "s/node-stream-port=.*/node-stream-port=`expr $cloudPortBegin + $dsOrder`/g" ds-$dsOrder/scripts/config-device-server-kai-node.properties


#config pid file location
sed -i "s/PID_DIR=.*/PID_DIR=.\/pid\/ds$dsOrder/g" ds-$dsOrder/scripts/linux/run-env.sh




