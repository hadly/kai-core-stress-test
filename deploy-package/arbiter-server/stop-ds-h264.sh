
. ~/stress-test-arbiter/stress-test.conf

echo ""
echo ""
echo "[stop h264] begin"
#---------------------------------------------------------------
#stop all h264
ssh -i ~/kaisquare.pem $h264UserName@$h264Host "cd ~/stress-test-h264/evo_server/scripts; sh kill.sh; "
echo "----all h264 stopped"
echo "[stop h264] end"


echo ""
echo ""
echo "[stop ds] begin"
#---------------------------------------------------------------
#stop all ds
for i in `seq $dsMachineNumber`
#for((i=1;i<=$dsMachineNumber;i++))
do
  whichDsHost=dsHost$i
  whichDsHost=${!whichDsHost}
  ssh -i ~/kaisquare.pem $dsUserName@$whichDsHost 'cd ~/stress-test-ds; sh stop-all-ds.sh'
  echo "----all ds stopped on machine $whichDsHost"

done
echo "[stop ds] end"
