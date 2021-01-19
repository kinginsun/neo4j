#!/bin/bash
M=$1

if [ "$M" == "down" ];then
  docker-compose -f docker-compose.yml down
  sudo chown ubuntu:ubuntu -R conf
else
  sudo chown 7474:7474 -R conf
  docker-compose -f docker-compose.yml up -d
fi
