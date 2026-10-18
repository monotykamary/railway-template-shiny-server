FROM rocker/shiny:4.6.1@sha256:ba09abb11d838e27a325c869f577be346dba3f8415f8435fbe042b3b5697837b

COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY start-shiny-server.sh /usr/local/bin/start-shiny-server
COPY app/ /srv/shiny-server/

RUN chmod +x /usr/local/bin/start-shiny-server     && chown -R shiny:shiny /srv/shiny-server

ENV APPLICATION_LOGS_TO_STDOUT=true
ENV PORT=3838

EXPOSE 3838

ENTRYPOINT ["/usr/local/bin/start-shiny-server"]
