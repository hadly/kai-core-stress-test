
. ./stress-test.conf

for i in `seq $dsNumOnThisMachine`;
#for((i=1;i<=$dsNumOnThisMachine;i++))
do
  echo "ds-$i"
  cat ds-$i/scripts/linux/log/2* |grep "REST"
done

