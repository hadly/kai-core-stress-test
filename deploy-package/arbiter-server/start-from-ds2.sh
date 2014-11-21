. ./stress-test.conf

dsMachineId=$1          #which ds machine
echo "------------------begin start ds-2 and other ds for ds machine $dsMachineId"

#add the left  devices to the other device servers
addOtherDevices()
{
  machineId=dsHost$dsMachineId
  machineId=`eval echo '$'$machineId`
  echo "----start other ds on machine $machineId"
  ssh -i ~/kaisquare.pem $dsUserName@$machineId "cd ~/stress-test-ds; sh start-other-ds.sh"
}

checkIfFirshDSFull()
{
  #the above start-all-ds.sh just started one ds.when 250 added to that ds.Then we will start the other device servers

  machineId=$dsMachineId
  serverIdBegin=${machineId}%
  sql="select id from ds_device_info where status=2 and server_id like \"${serverIdBegin}\" ; "
  addedDevNum=`mysql -u root -D $mysqlDBName -h$mysqlHost -p$mysqlPwd -e "$sql" | wc -l`
  echo "----addedDevNum=$addedDevNum"
  # If added device number is equal to the max number on each DS, then start other device servers
  
  while true;
  do
        addedDevNum=`mysql -u root -D $mysqlDBName -h$mysqlHost -p$mysqlPwd -e "$sql" | wc -l`
        echo "----addedDevNum=$addedDevNum"
        if [ $addedDevNum -eq `expr $eachDsDeviceNum + 1` ];then
          echo "------------DS one has been filled up, start other Device Servers."
          echo "----addedDevNum=$addedDevNum"
          echo ""
          addOtherDevices
          break
        else
          echo "----Device Server one has not been filled up, sleep 5 seconds."
          sleep 5
        fi
  done
}

#execute the function
checkIfFirshDSFull $dsMachineId
