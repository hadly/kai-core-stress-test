
. ./stress-test.conf


for i in `seq $dsNeededOnThisMachine`;do
  if [ $i -lt 2 ];then
    echo "----will not start the first DS"
    continue 
  fi

#for i in {2..$dsNeededOnThisMachine};do
#for((i=2;i<=$dsNeededOnThisMachine;i++));do
  cd ~/stress-test-ds/ds-$i/scripts/linux
  sh run-all-device-server.sh
  echo "----ds-$i started,sleep 20 seconds before start ds `expr $i + 1`"
  sleep 20
done

