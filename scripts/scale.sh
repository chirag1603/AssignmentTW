#!/bin/bash
echo "Extracting service id"
SVC=javawebapp_code
SID=$(docker service ls | grep -i $SVC | awk '{print $1}')
echo $SID
echo "scaling the application stack"
SCALE=1
docker service scale ${SID}=$SCALE
echo "Scaling service in progress ........will wait for 60s ........!!"
sleep 60
echo "Application scaled successfully !!"
