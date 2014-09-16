
. ./stress-test.conf

for i in `seq $dsNumOnThisMachine`
#for((i=1;i<=$dsNumOnThisMachine;i++))
do
  cp -r ds-template  ds-$i
done
