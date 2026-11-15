FROM rocker/shiny:4.6.2@sha256:9b5e77b37205f826115c3a832323b9a9a20d624376ee51323bba149abe1a2a3d

COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY start-shiny-server.sh /usr/local/bin/start-shiny-server
COPY app/ /srv/shiny-server/

RUN chmod +x /usr/local/bin/start-shiny-server     && chown -R shiny:shiny /srv/shiny-server

ENV APPLICATION_LOGS_TO_STDOUT=true
ENV PORT=3838

EXPOSE 3838

ENTRYPOINT ["/usr/local/bin/start-shiny-server"]
