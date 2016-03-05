#!/bin/sh

fp='/etc/security/limits.conf'

item='* soft nproc 65535'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='* hard nproc 65535'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='* soft nofile 1048576'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='* hard nofile 1048576'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

## DB
item='* hard sigpending 1031950'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='* soft sigpending 1031950'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

## user process limit
sed -i 's/1024/65535/g' /etc/security/limits.d/90-nproc.conf