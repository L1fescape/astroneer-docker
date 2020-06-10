FROM monokrome/wine

ARG steam_user=anonymous
ARG steam_password=

RUN apk update
RUN apk add make curl wine unzip

RUN ln -s /usr/bin/wine64 /usr/bin/wine
RUN chmod +x /usr/local/bin/xvfb-run

RUN xvfb-run -a wine cmd /c mkdir C:\\steamcmd

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
CMD sleep 100000