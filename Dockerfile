FROM ubuntu:22.04

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine64 wine32 wget && \
    apt install -y --reinstall winbind && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

RUN apt-get remove --purge -y wget \
        && apt-get clean autoclean \
        && apt-get autoremove -y

WORKDIR /steamcmd

RUN set -x \
        && mkdir -p "/server" \
        && bash "/steamcmd/steamcmd.sh" \
                +@sSteamCmdForcePlatformType windows \
                +force_install_dir /server \
                +login anonymous \
                +app_update 2857200 validate \
                +quit

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]