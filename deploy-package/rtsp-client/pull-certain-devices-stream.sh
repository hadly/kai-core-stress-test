# Note: This only support pull stream from one DS
pulledDevNum=$1




. ~/stress-test-arbiter/stress-test.conf
#eachDsDeviceNum=$wholeDeviceNum
#this scripts just can check one ds's 

#stop rtsp client
pkill rtsp_client
rm log/*


#start rtsp client
rtspPort=`expr $rtspPortBegin + 1`					#rtsp port on ds,start from 12021

mkdir -p log

rtspPortOfEachMachine=$rtspPort
  
for i in `seq $dsMachineNumber`;
#for((i=1;i<=$dsMachineNumber;i++))
do
  echo "-----------------------------pull h264 stream from machine $i"
  dsNumOnMachine=dsNeeded$i
  dsNumOnMachine=`eval echo '$'$dsNumOnMachine`  	#how many ds on this machine
  if [ $dsMachineNumber == 1 ];then
    echo "----only pull stream from one machine"
    dsNumOnMachine=$dsNeeded
  fi
  
  dsHost=dsHost$i
  dsHost=`eval echo '$'$dsHost`		#ds ip address
  rtspPortOfEachMachine=$rtspPort 		#for each machine,rtspPort is begin from 12020
 
  for j in `seq $dsNumOnMachine`; 
  do
    #echo "----begin pull h264 stream from ds-$j , rtsp port=$rtspPortOfEachMachine ,startDeviceId=$startDeviceId"
    #nohup ./rtsp_client $dsHost $rtspPortOfEachMachine $startDeviceId $eachDsDeviceNum >./log/machine$i-rtsp$j.log   2>&1 &
    #startDeviceId=`expr $startDeviceId + $eachDsDeviceNum`
    #rtspPortOfEachMachine=`expr $rtspPortOfEachMachine + 1`
    #echo "----sleep 2s"
    #sleep 2

    echo "----begin pull h264 stream from ds-$j , rtsp port=$rtspPortOfEachMachine ,startDeviceId=$startDeviceId"
    nohup ./rtsp_client $dsHost $rtspPortOfEachMachine $startDeviceId $pulledDevNum >./log/machine$i-rtsp$j.log   2>&1 &
 
  done
done


