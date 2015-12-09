FROM nginx:latest
MAINTAINER Albert Dixon <albert@dixon.rocks>

ENV T2_VER v2.2.1
ADD https://github.com/albertrdixon/tmplnator/releases/download/${T2_VER}/t2-linux.tgz /t2.tgz
RUN tar xvzf /t2.tgz -C /usr/local/bin && rm -f /t2.tgz

ADD *.tmpl /templates/
ADD docker-* /usr/local/bin/
RUN chmod +x /usr/local/bin/*
ENTRYPOINT ["docker-entry"]
CMD ["docker-start"]

ENV LISTEN_PORT   1090
ENV UPSTREAM_HOST 127.0.0.1
ENV UPSTREAM_PORT 8080