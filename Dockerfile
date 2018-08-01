FROM ubuntu:18.04
LABEL version="0.1"
LABEL description="A docker image for libvoikko, in purpose for running Finnish spell checks"
LABEL vendor="Sami Kallio"
LABEL "vendor.email"="phinaliumz at gmail.com"

RUN apt-get update && apt-get -y --no-install-recommends install enchant libenchant-voikko voikko-fi \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

CMD tail -f /dev/null
