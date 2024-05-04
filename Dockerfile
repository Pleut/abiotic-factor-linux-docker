FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y wine64 steamcmd && \
    apt-get install -y --reinstall winbind && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="$PATH:/usr/games"

WORKDIR /steamcmd

RUN set -x \
        && mkdir -p "/server" \
        && steamcmd \
                +@sSteamCmdForcePlatformType windows \
                +force_install_dir /server \
                +login anonymous \
                +app_update 2857200 validate \
                +quit

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]