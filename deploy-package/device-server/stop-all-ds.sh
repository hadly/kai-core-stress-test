
. ./stress-test.conf

for i in `seq $dsNumOnThisMachine`
#for((i=1;i<=$dsNumOnThisMachine;i++))
do
  cd ~/stress-test-ds/ds-$i/scripts/linux
  rm log/*
  sh kill-all-device-server.sh
done
