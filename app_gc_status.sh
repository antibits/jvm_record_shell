APP_NAME=$1
OPT_FILE=$2/$APP_NAME

MODULE_PID=`ps aux |grep ossuser| grep $APP_NAME| grep NFW|grep -v grep |awk 'NR==1{print $2}'`
echo "record "$APP_NAME" memory start"
echo "TIME    TOTAL    S0C    S1C    S0U    S1U    EC    EU    OC    OU    MC    MU    CCSC    CCSU    YGC    YGCT    FGC    FGCT    GCT" > $OPT_FILE
for((;;))
do	
	date | awk '{printf("%s "),$4}' >> $OPT_FILE
	ps aux |grep $MODULE_PID|grep $APP_NAME|grep -v grep |awk 'NR==1{printf("%d "),$6}' >> $OPT_FILE
	jstat -gc $MODULE_PID 0 1 | grep -v S0C >> $OPT_FILE
	echo $APP_NAME" memory recording ..."
	sleep 10		
done
echo "recording "$APP_NAME" memory end"