#!/bin/bash
#设置文件权限
sudo chmod 755 *.so
sudo chmod 755 mjpg_streamer
#添加开机启动
sudo cp -f webcam /etc/init.d/webcam
sudo chmod 755 /etc/init.d/webcam
sudo update-rc.d webcam defaults
