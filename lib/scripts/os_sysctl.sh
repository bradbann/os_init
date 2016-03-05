#!/bin/sh

fp='/etc/sysctl.conf'

item='net.ipv4.tcp_max_syn_backlog = 65535'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.core.netdev_max_backlog = 32768'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.core.somaxconn = 8192'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.ipv4.tcp_fin_timeout = 30'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.ipv4.tcp_window_scaling = 1'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.ipv4.tcp_sack = 1'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi

item='net.ipv4.tcp_timestamps = 0'
cat $fp | grep "$item"
if [ $? -ne 0 ];then
	echo "$item" >> $fp
fi
