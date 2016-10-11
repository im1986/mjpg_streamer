sudo chmod 755 *.so
sudo chmod 755 mjpg_streamer
sudo cp -f webcam /etc/init.d/webcam
sudo chmod 755 /etc/init.d/webcam
sudo update-rc.d webcam defaults
