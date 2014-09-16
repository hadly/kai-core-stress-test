
. ./stress-test.conf

servIdBegin=$1
for i in `seq $dsNumOnThisMachine`;
#for((i=1;i<=$dsNumOnThisMachine;i++))
do
 sh config-each-ds.sh $i $servIdBegin
done


