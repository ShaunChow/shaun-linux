#!/bin/bash

APP_NAME=$2

usage() {
    echo "Usage: sh runjar.sh [start|stop|restart|status] xxx.jar"
    exit 1
}

is_exist() {
    pid=$(ps -ef | grep java | grep $APP_NAME | grep -v grep | awk '{print $2}')
    echo pid = "${pid}"
    if [ -z "${pid}" ]; then
        return 1
    else
        return 0
    fi
}

start() {
    is_exist
    if [ $? -eq "0" ]; then
        echo "${APP_NAME} is already running. pid=${pid} ."
    else
        source /etc/profile
        BUILD_ID=dontKillMe
        nohup java -jar -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms1024m -Xmx1024m -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC ${APP_NAME} > /dev/null 2>&1 &
        echo "${APP_NAME} start success"
        sleep 10s
    fi
}

stop() {
    is_exist
    if [ $? -eq "0" ]; then
        kill -9 $pid
        echo "${APP_NAME} is stoped"
    else
        echo "${APP_NAME} is not running"
    fi
}

status() {
    is_exist
    if [ $? -eq "0" ]; then
        echo "${APP_NAME} is running. Pid is ${pid}"
    else
        echo "${APP_NAME} is NOT running."
    fi
}

restart() {
    stop
    start
}

case "$1" in
"start")
    start
    ;;
"stop")
    stop
    ;;
"status")
    status
    ;;
"restart")
    restart
    ;;
*)
    usage
    ;;
esac
