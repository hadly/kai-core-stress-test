
#clean all deploy before deploy
sh clean-all-deploy.sh

echo "----begin deploy arbiter"
sh deploy-arbiter.sh

echo "----begin deploy device server"
sh deploy-ds.sh

echo "----begin deploy h264"
sh deploy-h264.sh

echo "----deploy succeed"
