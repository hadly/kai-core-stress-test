
echo ""
echo ""
echo "[config arbiter] begin"
. ./stress-test.conf

#set mysql host
sed -i "s/jdbc-url=jdbc:mysql.*/jdbc-url=jdbc:mysql:\/\/$mysqlHost:3306\/$mysqlDBName?user=root\&password=$mysqlPwd/g" arbiter-server/scripts/config-arbiter-server.properties


#set max-device-num-on-device-server
sed -i "s/max-device-num-on-device-server.*/max-device-num-on-device-server=$eachDsDeviceNum/g" arbiter-server/scripts/config-arbiter-server.properties


#set devices number in mysql database. eg.if i want to test 2000 devices,i need set 2000 devices' model_id=110,others' model_id=100
sql="update devices set model_id=115 where id<=$wholeDeviceNum;update devices set model_id=100 where id>$wholeDeviceNum;"
mysql -u root -h$mysqlHost -D$mysqlDBName -p$mysqlPwd -e "$sql"

echo "[config arbiter] end"











