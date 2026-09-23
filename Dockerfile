FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xfce4-terminal \
    tightvncserver \
    novnc \
    websockify \
    curl \
    wget \
    nmap \
    sqlmap \
    netcat \
    dnsutils \
    iputils-ping \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.vnc && \
    echo "12345678" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

EXPOSE 8080 5901

CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && websockify --web=/usr/share/novnc/ ${PORT:-8080} localhost:5901"]
