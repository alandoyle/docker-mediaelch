#!/bin/sh

if [ "$VNC_PASSWORD" ]; then
    sed -i "s/^\(command.*x11vnc.*\)$/\1 -passwd '$VNC_PASSWORD'/" /etc/supervisord.conf
fi

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

export HOME=/config

# Set default MediaElch settings
if [ ! -f /config/.config/kvibes/MediaElch.conf ] ; then
    [ ! -d /config/.config/kvibes ] && mkdir -p /config/.config/kvibes
    echo -e "# Basic Config\n[General]\nMainWindowMaximized=true\n" > /config/.config/kvibes/MediaElch.conf
fi

/usr/bin/supervisord