FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    curl \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && websockify --web=/usr/share/novnc/ ${PORT:-8080} localhost:5901"]
