
echo ""
echo ""
echo "[deploy arbiter] begin"
mkdir -p ~/stress-test-arbiter
cp -r arbiter-server/* ~/stress-test-arbiter
cp stress-test.conf ~/stress-test-arbiter

cd ~/stress-test-arbiter
mkdir arbiter-server
mv device-arbiter-server arbiter-server
mv scripts arbiter-server
echo "[deploy arbiter] end"
