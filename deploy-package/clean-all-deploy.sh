
. ~/stress-test-arbiter/stress-test.conf


#stop all services before clean
cd ~/stress-test-arbiter
sh close-all.sh

#arbiter
rm -r ~/stress-test-arbiter
echo "----arbiter cleaned"

#h264
ssh -i ~/kaisquare.pem  $h264UserName@$h264Host "rm -r ~/stress-test-h264"
echo "----h264 cleaned"

#device server
for i in `seq $dsMachineNumber`;
#for((i=1;i<=$dsMachineNumber;i++))
do
  whichDsHost=dsHost$i   #here whichDsHost is "dsHost1"
  whichDsHost=`eval echo '$'$whichDsHost`  #here whichDsHost is 10.101...
  echo "----begin clean ds machine $whichDsHost"
  ssh -i ~/kaisquare.pem $dsUserName@$whichDsHost "rm -r ~/stress-test-ds"
  echo "----succeed clean ds machine $whichDsHost"
done



