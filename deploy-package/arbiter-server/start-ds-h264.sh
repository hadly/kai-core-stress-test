

echo ""
echo ""
echo "[start ds-h264] begin"
. ./stress-test.conf

#start h264 server
#------------------------------------
ssh -i ~/kaisquare.pem $h264UserName@$h264Host "cd ~/stress-test-h264/evo_server/scripts; sh run.sh; "


#if==0,do not want to test pull stream
if [ $wantToPullStrem -eq 0 ];then
  #just start all the device servers on each ds machine
  for i in `seq $dsMachineNumber`;do
  #for((i=1;i<=$dsMachineNumber;i++));do
    whichDsHost=dsHost$i
	whichDsHost=`eval echo '$'$whichDsHost`
	echo "----start ds on machine $whichDsHost"
	#must start all of the device servers needed in start-all-ds.sh
	ssh -i ~/kaisquare.pem $dsUserName@$whichDsHost "cd ~/stress-test-ds; sh start-all-ds.sh;"
	echo "----all ds started on machine $whichDsHost"
  done
else
  #for each ds machine, start one ds ,then start-from-ds2.sh
  for j in `seq $dsMachineNumber`;do
  #for((j=1;j<=$dsMachineNumber;j++));do
    whichDs=dsHost$j
	whichDs=`eval echo '$'$whichDs`
    #just start one ds in scripts "start-all-ds.sh"
	echo "----you want to test pull stream from device server"
	echo "----start first ds on machine $whichDs"
    ssh -i ~/kaisquare.pem $dsUserName@$whichDs "cd ~/stress-test-ds; sh start-all-ds.sh;"
    echo "----start other ds on machine $whichDs"
    #start ds-2 3 4 ...to 20
    sh start-from-ds2.sh $j
  done
fi

echo "[start ds-h264] end"
