## os_init 操作系统初始化

#### 适用
```
CentOS 6.5等
```

#### 功能说明
```
通常在操作系统安装完成时执行，例如配置DNS、配置YUM源、Bash审计、时间同步、系统内核参数调优、ulimit调优、SSH优化、安全配置等。
具体见lib/scripts目录下的脚步
```

#### 使用方法
```
Usage: python os_init.py [options]  

Options:  
   -h, --help            show this help message and exit  
   -f FILE, --file=FILE  path of config file,must  
   -g GROUPS, --groups=GROUPS  
     which groups to use,when no set,use the field 'groups'  
     in config file as default  
```

#### 举例说明
```
# python os_init.py -f etc/os_init.conf
1）读取etc/os_init.conf配置文件，注意配置文件中设定的脚本路径为相对路径
2）应用配置文件中default组
```

#### 注意
```
所有配置的脚本，以串行的方式执行。
任何问题，可以加QQ86877295交流^_^
```

