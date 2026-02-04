#!/bin/bash

launch() {
    local name=$1
    local cmd=$2
    echo "Starting $name..."

    while true; do
        $cmd
        echo "Process $name crashed with exit code $?. Respawning in 1s..."
        sleep 1
    done
}

launch "Xvfb" "/usr/bin/Xvfb :0 -screen 0 1024x768x16" &
sleep 2

launch "IceWM" "/usr/bin/icewm-session" &
launch "x11vnc" "/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -wait 5 -permitfiletransfer -tightfilexfer -rfbport 5901 -rfbauth /etc/x11vnc.pass -forever -shared" &
launch "xrdp" "/usr/sbin/xrdp -n" &

wait
