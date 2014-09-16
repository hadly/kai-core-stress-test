
. ./stress-test.conf

for i in `seq $dsNumOnThisMachine`;
#for((i=1;i<=$dsNumOnThisMachine;i++))
do 
  rm ds-$i/scripts/linux/core
done

