function start(){
/serverspeeder/bin/serverSpeeder.sh start
}
function stop(){
/serverspeeder/bin/serverSpeeder.sh stop
}
function restart(){
/serverspeeder/bin/serverSpeeder.sh restart
}
function status(){
/serverspeeder/bin/serverSpeeder.sh status
}
function peizhi(){
checkos
 if [ "$OS" == 'CentOS' ]; then
  vi /serverspeeder/etc/config
 else
  vim /serverspeeder/etc/config
 fi
}

function checkos(){
	if [ -f /etc/redhat-release ];then
        OS=CentOS
		echo "
		
		
		Your OS is CentOS"
    elif [ ! -z "`cat /etc/issue | grep bian`" ];then
        OS=Debian
		echo "
		
		
		Your OS is Debian"
    elif [ ! -z "`cat /etc/issue | grep Ubuntu`" ];then
        OS=Ubuntu
		echo "
		
		
		Your OS is Ubuntu"
    else
        echo "Not support OS, Please reinstall OS and retry!"
        exit 1
    fi
}

if [ ! -n "$1" ]; then
 status
elif [ $1 = "start" ]; then
 start
elif [ $1 = "stop" ]; then
 stop
elif [ $1 = "restart" ]; then
 restart
 elif [ $1 = "status" ]; then
 status
  elif [ $1 = "peizhi" ]; then
 peizhi
else 
	echo "
	print error bash start 
	bash start lnmp to install lnmp
	bash start ss to install shadowsocks
	"
	exit 1
fi
