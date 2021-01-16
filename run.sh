#!/bin/bash
M=$1

if [ "$M" == "down" ];then
  docker-compose -f docker-compose.yml down
else
  docker-compose -f docker-compose.yml up -d
fi
