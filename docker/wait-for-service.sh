#!/bin/bash


service_name="${NAME:=NO SERVICE}"
sleep_time="${SLEEP_TIME:=3}"
service_timeout="${TIMEOUT:=3}"

while ! (timeout "$service_timeout" bash -c "</dev/tcp/${HOST}/${PORT}") &> /dev/null;
do
    echo waiting for "$service_name" to start...;
    sleep "$sleep_time";
done;