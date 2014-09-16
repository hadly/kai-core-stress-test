
#! /bin/bash

echo ""
echo ""
echo "[stop arbiter] begin"
. ~/stress-test-arbiter/stress-test.conf

cd arbiter-server/scripts/linux/log
rm *
cd ../
sh kill-all-java-server.sh


sql="delete from device_events; delete from ds_device_info; delete from ds_server_info; "

#mysql -u root -Djuzz4v2 -pAptx4869 -e "$sql"

mysql -u root -h$mysqlHost -D$mysqlDBName -p$mysqlPwd -e "$sql"

echo "[stop arbiter] end"

