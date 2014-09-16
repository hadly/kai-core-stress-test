
. ./stress-test.conf

sql="select * from ds_device_info limit 1 \G;"

mysql -u root -h$mysqlHost -D$mysqlDBName -p$mysqlPwd -e "$sql"

