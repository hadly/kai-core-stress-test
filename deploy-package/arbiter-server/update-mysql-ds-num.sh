
sql="update devices set model_id=115 where id<=$wholeDeviceNum;update devices set model_id=100 where id>$wholeDeviceNum;"

mysql -u root -h$mysqlHost -D$mysqlDBName -p$mysqlPwd -e "$sql"









