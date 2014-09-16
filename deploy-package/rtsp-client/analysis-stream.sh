
. ~/stress-test-arbiter/stress-test.conf

rm resultForAnalysis.log

for i in `seq $dsMachineNumber`;
#for((i=1;i<=$dsMachineNumber;i++))
do
  echo "\n **************************************pull stream info on machine $i" >> resultForAnalysis.log
 
  for j in `seq $dsNeeded`
  #for((j=1;j<=$dsNeeded;j++))
  do
    echo "\n ----h264 stream from machine$i-ds$j:" >> resultForAnalysis.log
    echo "---------------------------------------------------------------" >> resultForAnalysis.log
    let lines=$eachDsDeviceNum*4 
    tail -n $lines log/machine$i-rtsp$j.log  >> resultForAnalysis.log
  done
done
