

echo ""
echo ""
echo "[deploy h264] begin"
. ./stress-test.conf

echo "----begin deploy h264 on machine $h264Host"

ssh -i ~/kaisquare.pem $h264UserName@$h264Host "mkdir -p ~/stress-test-h264"
scp -i ~/kaisquare.pem -r h264-server/* $h264UserName@$h264Host:~/stress-test-h264
echo "[deploy h264] end"
