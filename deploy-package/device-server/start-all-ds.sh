
#just start one device server,when 250 devices added to this one, other ds will started by arbter
#
. ./stress-test.conf

firstStartDsNum=$dsNeededOnThisMachine
if [ $wantToPullStrem -eq 1 ]
then
 firstStartDsNum=1
fi

for i in `seq $firstStartDsNum`;
#for((i=1;i<=$firstStartDsNum;i++))
do
  cd ~/stress-test-ds/ds-$i/scripts/linux
  sh run-all-device-server.sh
done


