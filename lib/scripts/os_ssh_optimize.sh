#!/bin/sh

#禁止ssh使用DNS解析
sed -i "s@#UseDNS yes@UseDNS no@g" /etc/ssh/sshd_config

#去除ssh首次访问yes回答 
sed -i 's%#   StrictHostKeyChecking ask%StrictHostKeyChecking no%g'  /etc/ssh/ssh_config

/etc/init.d/sshd reload
