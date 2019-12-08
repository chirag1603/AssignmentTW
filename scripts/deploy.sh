#!/bin/bash
set -x 
echo $PWD
echo "Verifying Docker images"
docker images | grep -i stack | awk '{print $1}'
status=$?
docker images | grep -i code | awk '{print $1}'
status1=$?

if [ $status -eq 0 -a  $status1 -eq 0 ]; then
  echo "images verified successfully"
  echo "deploying the compose stack in swarm"
  docker stack deploy --compose-file=$PWD/docker-compose.yml javawebapp
  echo $?
  if [ $? -eq 0 ]; then
    echo "stack has been deployed successfully ...... will wait for 2 minutes for next step..........!!"
    sleep 120
    ID=$(docker ps -f name=javawebapp_code --format "{{.ID}}")
    for i in ${ID}
    do
      docker cp /var/lib/docker/volumes/javawebapp_data-volume/_data/. ${ID}:/usr/local/tomcat/webapps/companyNews/
    done
    echo "Files copied successfully inside the contaners"
  fi
fi
