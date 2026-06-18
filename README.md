# Docker container for MediaElch
[![Docker Image Size](https://img.shields.io/docker/image-size/alandoyle/mediaelch/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/mediaelch/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/alandoyle/mediaelch?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/mediaelch)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/alandoyle/docker-mediaelch)

This is a Docker container for [MediaElch](https://www.mediaelch.de/mediaelch/).

The graphical user interface (GUI) of the application can be accessed through a
modern web browser, requiring no installation or configuration on the client.

---

[![MediaElch logo](https://images.weserv.nl/?url=raw.githubusercontent.com/alandoyle/docker-mediaelch/main/MediaElch-logo.png&w=110)](https://www.mediaelch.de/mediaelch/)[![MediaElch](https://images.placeholders.dev/?width=256&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=MediaElch&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.mediaelch.de/mediaelch/)

MediaElch is a MediaManager for Kodi. Information about Movies, TV Shows, Concerts and Music are stored as NFO files. Fanarts are downloaded automatically from fanart.tv.

---

## Docker

Available on [DockerHub](https://hub.docker.com/r/alandoyle/mediaelch)
```bash
docker pull alandoyle/mediaelch
```

---

## Usage

```bash
docker run --name=mediaelch \
  -d --init \
  -v <MY_CONFIG_PATH>:/config \
  -v <MY_MEDIA_PATH>:/media \
  -p 80:8080/tcp \
  -p 5900:5900/tcp \
  alandoyle/mediaelch:latest
```

Docker compose example:

```yaml
---
services:
  mediaelch:
    image: alandoyle/mediaelch:latest
    container_name: mediaelch
    restart: unless-stopped
    init: true
    ports:
      - 80:8080  # If you want to go mediaelch through a browser
      - 5900:5900  # If you want to use a VNC client instead of the browser
    volumes:
      - /Storage/Incoming:/media
      - ./config:/config
    environment:
      - RESOLUTION=1600x900 # Change resolution (default: 1366x768)
      # - VNC_PASSWORD=8charpwd
    restart: always
    shm_size: "1gb"
```

---

### Ports

| Port       | Description           |
|------------|-----------------------|
| `8080/tcp` | NOVNC HTTP Port       |
| `5900/tcp` | VNC Port              |

---

### Volumes

| Path      | Description                              |
|-----------|------------------------------------------|
| `/config` | path for MediaElch configuration files   |
| `/media`  | path for MediaElch media files           |

### Contributions
Contributions are welcome! Feel free to submit issues or pull requests to improve this project.