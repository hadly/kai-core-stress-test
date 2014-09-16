
pid=$(cat kainode.pid)
echo "killing kainode-simulator $pid ..."
kill -9 $pid
rm kainode.pid
rm kainode.log
