FROM debian:jessie

ARG steam_user=anonymous
ARG steam_password=

RUN apt update && apt install -y build-essential curl wine unzip

RUN wine cmd /c mkdir C:\\steamcmd

# install steamcmd for windows
# https://developer.valvesoftware.com/wiki/SteamCMD#Manually
RUN mkdir -p $HOME/.wine/drive_c/steamcmd && \
    cd $HOME/.wine/drive_c/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" > steamcmd.zip && \
    unzip steamcmd.zip && \
    rm steamcmd.zip

COPY ./Makefile $WORKDIR
CMD make install