. ../../stress-test.conf

#deploy all of the kainode simulator
echo "----deploy $dsNeeded kainode simulators"
#TODO: if there are more than one DS machines ,this will be a bug
#kainode simulator number will not equal to $dsNeeded

deviceIdBegin=1

for i in `seq $dsNeeded`;
#for((i=1;i<=$dsNeeded;i++))
do
  mkdir -p simulator-$i
  
  # will only copy files and directories which not started by "simulator" to the dest dir
  cp -r `ls | grep -v "^simulator-"` ./simulator-$i

  #update configuration file
  sed -i "s/cloud-port=.*/cloud-port=`expr $cloudPortBegin + $i`/g"   simulator-$i/config-node-simulator.properties

  sed -i "s/cloud-host=.*/cloud-host=$dsHost1/g" simulator-$i/config-node-simulator.properties
  sed -i "s/start-id=.*/start-id=$deviceIdBegin/g" simulator-$i/config-node-simulator.properties
  sed -i "s/device-num=.*/device-num=$eachDsDeviceNum/g" simulator-$i/config-node-simulator.properties

  deviceIdBegin=`expr $deviceIdBegin + $eachDsDeviceNum`

done
