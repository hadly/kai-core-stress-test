#! /bin/bash
#set h264 server rate 

echo ""
echo ""
echo "[config h264] begin"
. ./stress-test.conf
scp -i ~/kaisquare.pem stress-test.conf $h264UserName@$h264Host:~/stress-test-h264
scp -i ~/kaisquare.pem clone-kainode-simulators.sh $h264UserName@$h264Host:~/stress-test-h264/evo_server/kainode-simulator

ssh -i ~/kaisquare.pem $h264UserName@$h264Host "cd ~/stress-test-h264/evo_server/scripts; sed -i \"s/rate=.*/rate=$h264Rate/g\" run.sh ; cd ../kainode-simulator; sh clone-kainode-simulators.sh; "


echo "[config h264] end"
