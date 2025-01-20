Golang core dump POC
===


在 ubuntu 中默认的 core dump 文件位置

cat /proc/sys/kernel/core_pattern
|/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h

在 RHEL 中默认的 core dump 文件位置
cat /proc/sys/kernel/core_pattern
core

修改该配置
sysctl -w kernel.core_pattern=core

特别的  该配置是宿主机级别的 无法在容器内部进行更改
