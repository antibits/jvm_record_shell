ps -elf | grep app_gc_status.sh | grep ossuser |grep -v grep | awk '{print $4}'|xargs kill 
echo "stoping all module memory recoding..."
sleep 5
echo "success"