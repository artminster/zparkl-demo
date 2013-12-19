#!/bin/bash
set -e
LOGFILE=/home/nmonteiro/logs/zparkl_demo_gunicorn.access.log
ERRORFILE=/home/nmonteiro/logs/zparkl_demo_gunicorn.error.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
#The below address:port info will be used later to configure Nginx with Gunicorn
ADDRESS=unix:/var/run/zparkl_demo.sock
# user/group to run as
#USER=your_unix_user
#GROUP=your_unix_group
cd /home/nmonteiro/sites/zparkl_demo/repository
source ../env/bin/activate
export PYTHONPATH=$PYTHONPATH:/home/nmonteiro/sites/zparkl_demo/repository/allauth
export PYTHONPATH=$PYTHONPATH:/home/nmonteiro/sites/zparkl_demo/repository/rawjam
export PYTHONPATH=$PYTHONPATH:/home/nmonteiro/sites/zparkl_demo/repository/artminster
test -d $LOGDIR || mkdir -p $LOGDIR
exec ../env/bin/gunicorn_django -w $NUM_WORKERS --bind=$ADDRESS \
--log-level=debug --settings=zparkl_demo.configs.production.settings \
--log-file=$LOGFILE 2>>$LOGFILE  1>>$ERRORFILE
