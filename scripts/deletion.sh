#!/bin/bash
echo "deletion of application stack"
docker stack rm javawebapp
sleep 120
echo "deletion of application stack successfully"
docker volume rm javawebapp_data-volume
docker volume ls 
echo "deletion of volume successfully"
