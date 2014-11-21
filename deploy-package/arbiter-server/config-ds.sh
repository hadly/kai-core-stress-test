
. ./stress-test.conf

echo ""
echo ""
echo "[config ds] begin"
servIdBegin=$serverIdBegin
for i in `seq $dsMachineNumber`;
#for((i=1;i<=$dsMachineNumber;i++))
do
  
  #config how many ds needed on each ds machine
  dsNeededOnEach=dsNeeded$i
  dsNeededOnEach=`eval echo '$'$dsNeededOnEach`

  whichDsHost=dsHost$i
  whichDsHost=`eval echo '$'$whichDsHost`
  
  #renew the stress-test.conf on ds machine
  #set dsNeededOnThisMachine in stress-test.conf
  sed -i "s/dsNeededOnThisMachine=.*/dsNeededOnThisMachine=$dsNeededOnEach/g" ./stress-test.conf
  #if there is only on ds machine, set dsNeeded1=dsNeeded
  if [ $dsMachineNumber == 1 ]
  then
    sed -i "s/dsNeededOnThisMachine=.*/dsNeededOnThisMachine=$dsNeeded/g" ./stress-test.conf
  fi
  
  #dsHostOfThisMachine
  sed -i "s/dsHostOfThisMachine=.*/dsHostOfThisMachine=$whichDsHost/g" ./stress-test.conf


  scp -i ~/kaisquare.pem ./stress-test.conf $dsUserName@$whichDsHost:~/stress-test-ds/

  #config ds machine $whichDsHost serverId from $servIdBegin
  ssh -i ~/kaisquare.pem $dsUserName@$whichDsHost "cd ~/stress-test-ds/; sh config-all-ds.sh $servIdBegin"
  servIdBegin=`expr $servIdBegin + 100`

done

echo "[config ds] end"



