FROM bitnami/minideb:latest-amd64

RUN install_packages curl ca-certificates unzip cron tmpreaper parallel

RUN \  
  curl -o /tmp/ezshare.zip -LO https://github.com/mifi/ezshare/releases/latest/download/ezshare-linux.zip &&\
  mkdir /app && unzip /tmp/ezshare.zip -d /app &&\
  rm /tmp/ezshare.zip &&\
  chmod 0755 /app/ezshare/ezshare /app/ezshare/clipboard &&\
  mkdir /data

COPY crontab /etc/cron.d/clean-files
COPY clean-files.sh /app/clean-files.sh
RUN chmod 0755 /app/clean-files.sh && chmod 0644 /etc/cron.d/clean-files && touch /var/log/cron.log

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh

ENV CLEAR_AFTER=1h
ENV CLEAR_FILES=true

EXPOSE 8080
ENTRYPOINT [ "/entrypoint.sh" ]