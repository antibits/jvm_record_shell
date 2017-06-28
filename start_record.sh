MODULES=`echo "designerui \
designer"`

CUR_PATH=`pwd`
MODULE_MEM_TRACE_PATH=$CUR_PATH/module_memory
mkdir -p $MODULE_MEM_TRACE_PATH
chmod 777 $MODULE_MEM_TRACE_PATH -R

for module_name in $MODULES
do
	su - ossuser $CUR_PATH/app_gc_status.sh $module_name $MODULE_MEM_TRACE_PATH &
done