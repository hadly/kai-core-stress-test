

echo ""
echo ""
echo "[deploy ds] begin"
. ./stress-test.conf

#deploy device servers on each machine 
deployEachDsMachine()
{
  dsHost=$1
  
  echo "----begin deploye $dsNumOnThisMachine ds on machine $dsHost"

  ssh -i ~/kaisquare.pem $dsUserName@$dsHost "mkdir -p ~/stress-test-ds;"
  echo "----make directory stress-test-ds ok"

  scp -i ~/kaisquare.pem -r device-server/* $dsUserName@$dsHost:~/stress-test-ds
  scp -i ~/kaisquare.pem stress-test.conf $dsUserName@$dsHost:~/stress-test-ds
  #ssh kaiadmin@$dsHost "echo \"dsNumOnThisMachine=$dsNumOnThisMachine\" >> ~/stress-test-ds/stress-test.conf"
  echo "----copy .sh and execute files ok"

  #clone several ds on this machine
  ssh -i ~/kaisquare.pem $dsUserName@$dsHost "cd ~/stress-test-ds/; sh clone-several-ds.sh $dsNumOnThisMachine"
  echo "----clone ds ok"

}


#deploy all of the device se

echo "----deploy $dsMachineNumber device server machines"
for i in `seq $dsMachineNumber`
#for((i=1;i<=$dsMachineNumber;i++))
do
  whichDsHost=dsHost$i
  whichDsHost=`eval echo '$'$whichDsHost`
  echo "----deploy ds machine $whichDsHost"
  deployEachDsMachine $whichDsHost
  echo "----deploy succeed on machine $whichDsHost "

done

echo "[deploy ds] end"
