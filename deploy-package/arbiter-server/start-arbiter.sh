. ./stress-test.conf

echo ""
echo ""
echo "[start arbiter] begin"
cd arbiter-server/scripts/linux
sh run-all-java-server.sh

#cd ~/stress-test-arbiter
#rm top.log
#top -c -b -d 2 -u kaiadmin >> top.log &

echo "[start arbiter] end"



dsDeviceInfoSql="select id from ds_device_info;"
devicesSql="select id from devices;"
numInDevices=`mysql -u root -D $mysqlDBName -h$mysqlHost -p$mysqlPwd -e "$devicesSql" | wc -l`

while true;
  do    
    numInDsDeviceInfo=`mysql -u root -D $mysqlDBName -h$mysqlHost -p$mysqlPwd -e "$dsDeviceInfoSql" | wc -l`
    if [ $numInDsDeviceInfo -eq $numInDevices ];then
      echo "Devices in ds_device_info and in devices are the same."
	  
      removeDsDeviceInfoSql="delete from ds_device_info where id > $wholeDeviceNum;"
      mysql -u root -D $mysqlDBName -h$mysqlHost -p$mysqlPwd -e "$removeDsDeviceInfoSql"
	  
      break
    else
      echo "Devices in ds_device_info is $numInDsDeviceInfo, sleep 5 seconds."
      sleep 5
    fi
done



