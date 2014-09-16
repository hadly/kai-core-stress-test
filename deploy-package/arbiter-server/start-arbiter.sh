
echo ""
echo ""
echo "[start arbiter] begin"
cd arbiter-server/scripts/linux
sh run-all-java-server.sh

#cd ~/stress-test-arbiter
#rm top.log
#top -c -b -d 2 -u kaiadmin >> top.log &

echo "[start arbiter] end"
