FROM ubuntu:15.04

MAINTAINER Vincent Palmer <shift@someone.section.me>

RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes openssl
ADD rel/vernemq /srv/vernemq
ADD docker/files/vernemq.conf /srv/vernemq/etc/vernemq.conf

EXPOSE 1883
EXPOSE 880
EXPOSE 800

ENTRYPOINT ["/srv/vernemq/bin/vernemq", "console"]
