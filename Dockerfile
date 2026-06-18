# Define software versions.
ARG MEDIAELCH_VERSION=2.12.0-r0

FROM alpine:edge

# update upgrade and install dependencies
RUN echo http:"//dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && apk upgrade && apk add --no-cache \
  xvfb x11vnc openbox mediaelch supervisor bash novnc websockify \
  adwaita-icon-theme font-dejavu xdotool dos2unix

# Patch MediaElch until new version released (see https://github.com/Komet/MediaElch/issues/1992)
RUN sed -i 's/include_adult/unclude_adult/' /usr/bin/MediaElch

# create symlink for noVNC config
RUN ln -s /usr/share/novnc/vnc_lite.html /usr/share/novnc/index.html

# Add files.
COPY rootfs/ /

# Dos2Unix all files
RUN dos2unix /entry.sh
RUN dos2unix /etc/supervisord.conf
RUN dos2unix /etc/openbox/main-window-selection.xml

# Make entrypoint executable
RUN chmod +x /entry.sh

ENV DISPLAY=:0
ENV RESOLUTION=1366x768

EXPOSE 5900 8080

ENTRYPOINT ["/bin/bash", "-c", "/entry.sh"]
