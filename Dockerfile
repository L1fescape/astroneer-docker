FROM scottyhardy/docker-wine:latest

ENV RUN_AS_ROOT=yes

RUN apt-get update
RUN apt-get install -y curl unzip

RUN mkdir -p ~/.wine/drive_c/steamcmd && \
  cd ~/.wine/drive_c/steamcmd && \
  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" > steamcmd.zip && \
  unzip steamcmd.zip && \
  rm steamcmd.zip

COPY install_astroneer.txt /root/.wine/drive_c/steamcmd
RUN DBUS_FATAL_WARNINGS=0 wine C:\\steamcmd\\steamcmd.exe +runscript install_astroneer.txt; exit 0

CMD DBUS_FATAL_WARNINGS=0 wine C:\\steamcmd\\steamcmd.exe
ENTRYPOINT ["/usr/bin/entrypoint"]