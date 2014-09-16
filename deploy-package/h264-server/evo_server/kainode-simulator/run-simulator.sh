
#start kainode-simulator
nohup ./kainodeSimulator ./config-node-simulator.properties > ./kainode.log 2>&1 &
echo $! > ./kainode.pid
