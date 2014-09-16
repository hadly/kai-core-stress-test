. ../../stress-test.conf

cd ../kainode-simulator
for i in `seq $dsNeeded`;do
#for((i=1;i<=$dsNeeded;i++));do
  cd simulator-$i
  sh kill-simulator.sh
  echo "----simulator-$i killed"
  cd ..
done
