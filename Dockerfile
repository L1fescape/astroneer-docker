FROM debian:jessie

ARG steam_user=anonymous
ARG steam_password=

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  unzip \
  wine \
  xvfb

# start and detach
RUN Xvfb :99 &

RUN DISPLAY=:99 wine cmd /c mkdir C:\\steamcmd

# install steamcmd for windows
# https://developer.valvesoftware.com/wiki/SteamCMD#Manually
RUN mkdir -p $HOME/.wine/drive_c/steamcmd && \
  cd $HOME/.wine/drive_c/steamcmd && \
  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" > steamcmd.zip && \
  unzip steamcmd.zip && \
  rm steamcmd.zip

COPY ./Makefile $WORKDIR
# RUN make install
# CMD make start
CMD make install