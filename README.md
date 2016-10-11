mjpg-streamer
=============

Currently no issues are known, but since this software is quite young and not used widely it may cause problems. You must really know what you are doing, if you use this software. If you want to use the software you are obliged to check if the sourcecode does what you expect it to do and take the risk yourself to use it.


Usage
=====
sudo git clone https://github.com/im1986/mjpg_streamer.git

cd mjpg_streamer

sh setup.sh

sudo nano /etc/init.d/webcam

#! /bin/sh
### BEGIN INIT INFO
# Provides: OSSEC HIDS
# Required-Start: $network $remote_fs $syslog $time
# Required-Stop:
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: OSSEC HIDS
### END INIT INFO
# /etc/init.d/webcam
# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting webcam script"
    export LD_LIBRARY_PATH="/home/pi/mjpg_streamer/mjpg_streamer"
    /home/pi/mjpg_streamer/mjpg_streamer -i "input_uvc.so -r 640x480 -f 20 -n" -o "output_http.so -p 8080 -w /home/pi/mjpg_streamer/www" &
    ;;
  stop)
    echo "Stopping webcam script"
    killall mjpg_streamer
    ;;
  *)
    echo "Usage: /etc/init.d/webcam {start|stop}"
    exit 1
    ;;
esac
exit 0

sudo chmod 755 /etc/init.d/webcam
sudo update-rc.d webcam defaults

When launching mjpg-streamer, you specify one or more input plugins and an output plugin. For example, to stream a V4L compatible webcam via an HTTP server (the most common use case), you
can do something like this:

	mjpg_streamer -i input_uvc.so -o output_http.so

Each plugin supports various options, you can view the plugin's options via its `--help` option:

	mjpg_streamer -i 'input_uvc.so --help'


More examples can be found in the start.sh bash script.

Plugin documentation
====================

Input plugins:

* input_file
* input_http
* input_opencv ([documentation](plugins/input_opencv/README.md))
* input_ptp2
* input_raspicam ([documentation](plugins/input_raspicam/README.md))
* input_uvc ([documentation](plugins/input_uvc/README.md))

Output plugins:

* output_file
* output_http ([documentation](plugins/output_http/README.md))
* output_rtsp
* output_udp
* output_viewer ([documentation](plugins/output_viewer/README.md))

