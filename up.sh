#!/bin/bash

echo "Tengine Manger!"
echo 
echo "Usage:"
echo "start:    startup tengine"
echo "restart:  restart tengine"
echo "stop:     stop tengine"
echo

read Arg

case $Arg in
	start)
		docker run -h="tengine" --name tengine -d -i -t -p 80:80 -p 443:443 -v /root/docker-data/tengine/conf/:/usr/local/nginx/conf/ -v /root/docker-data/tengine/logs:/usr/local/nginx/nginx_logs tengine /bin/bash
	;;
	restart)
		docker stop tengine
		docker rm tengine
		docker run -h="tengine" --name tengine -d -i -t -p 80:80 -p 443:443 -v /root/docker-data/tengine/conf/:/usr/local/nginx/conf/ -v /root/docker-data/tengine/logs:/usr/local/nginx/nginx_logs tengine /bin/bash
	;;
	stop)
		docker stop tengine
	;;
esac
