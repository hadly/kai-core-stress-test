
deviceKey=$1
sql="select id from devices where device_key=\"$deviceKey\";"

mysql -u root -h10.101.0.116 -D$mysqlDBName -p$mysqlPwd -e "$sql"

