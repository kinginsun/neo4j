#!/bin/bash

set -e

M=$1
if [ "$M" == "" ];then
    M="up"
    echo "usage: ./deploy.sh message"
fi


find . -name "*.sh" -exec chmod +x {} +


git add -A
git commit -m "$M"
git push origin main


# echo "============================================================"
echo "updating hk2api"
if [ "$M" == 'REBUILD' ];then
  ssh ubuntu@hk.xanda.hk 'cd ~/neo4j && git pull && ./run.sh down && ./run.sh exit'
else
  ssh ubuntu@hk.xanda.hk 'cd ~/neo4j && git pull && ./run.sh down && ./run.sh exit'
fi
echo "=========================   DONE   ========================="
