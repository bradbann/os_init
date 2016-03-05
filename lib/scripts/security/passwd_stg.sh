#!/bin/sh

## 设置普通帐号连续输错5次密码，锁定1分钟
fp="/etc/pam.d/sshd"
cat ${fp} | grep 'pam_tally2.so deny=5'
if [ $? -ne 0 ];then
	lnum=$(cat  ${fp} | grep -nE '^#%PAM'| tail -n 1|awk -F: '{print $1}')
	sed -i "${lnum}a auth       required     pam_tally2.so deny=5 unlock_time=60"  ${fp}
fi

## 密码复杂度策略设置:至少8位，包含一位大写字母，一位小写字母和一位数字
fp="/etc/pam.d/system-auth"
item="password    requisite     pam_cracklib.so difok=3 minlen=8 ucredit=-1 lcredit=-1 dcredit=1"
cat ${fp} | grep "${item}"
if [ $? -ne 0 ];then
	lnum=$(cat  ${fp} | grep -nE '^password'| tail -n 1|awk -F: '{print $1}')
	sed -i "${lnum}a ${item}"  ${fp}
fi

## 设置SSH服务修改允许密码错误次数（默认6次）
sed -i "s/#MaxAuthTries 6/MaxAuthTries 3/" /etc/ssh/sshd_config

## restart sshd
/etc/init.d/sshd restart
