#!/bin/sh

#关闭服务
echo "Disable Service: iptables & postfix."
/sbin/chkconfig iptables off
/sbin/service iptables stop

/sbin/chkconfig postfix off
/sbin/service postfix stop

/sbin/chkconfig ip6tables  off
/sbin/service ip6tables stop

#禁用SELINUX
echo "Disable Selinux."
setenforce 0
sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config


