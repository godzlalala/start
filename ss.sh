function start(){
/etc/init.d/shadowsocks start
}
function stop(){
/etc/init.d/shadowsocks stop
}
function restart(){
/etc/init.d/shadowsocks restart
}
function status(){
/etc/init.d/shadowsocks status
}
function config(){
checkos
if [ ! -f "/etc/shadowsocks.json" ]; then
 if [ "$OS" == 'CentOS' ]; then
  vi /etc/shadowsocks-libev/config.json
 else
  vim /etc/shadowsocks-libev/config.json
 fi
else
 if [ "$OS" == 'CentOS' ]; then
  vi /etc/shadowsocks.json
 else
  vim /etc/shadowsocks.json
 fi
fi
}

function checkos(){
	if [ -f /etc/redhat-release ];then
        OS=CentOS
    elif [ ! -z "`cat /etc/issue | grep bian`" ];then
        OS=Debian
    elif [ ! -z "`cat /etc/issue | grep Ubuntu`" ];then
        OS=Ubuntu
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
  elif [ $1 = "config" ]; then
 config
else 
	echo "
	print error ./ss.sh $1
	./ss.sh start to start shadowsocks
	./ss.sh stop to stop shadowsocks
	./ss.sh status to view shadowsocks
	./ss.sh config to vim shadowsocks's confing
	"
	exit 1
fi
