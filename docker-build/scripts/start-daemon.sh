#!/bin/bash

mkdir -p $INFLUXDB_HOME/logs
nohup $INFLUXDB_HOME/mate/influxdb-mate >>$INFLUXDB_HOME/logs/influxdb_mate.stdout.log 2>>$INFLUXDB_HOME/logs/influxdb_mate.stderr.log &
