. ../../stress-test.conf

cd ../kainode-simulator
for i in `seq $dsNeeded`;do
#for((i=1;i<=$dsNeeded;i++));do
  cd simulator-$i
  sh run-simulator.sh
  echo "----simulator-$i started,sleep 2 seconds before start simulator `expr $i + 1`"
  sleep 2
  cd ../
done
