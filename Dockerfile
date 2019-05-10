FROM ubuntu:18.04
LABEL version="0.1"
LABEL description="A docker image for libvoikko, in purpose for running Finnish spell checks"
LABEL vendor="Sami Kallio"
LABEL "vendor.email"="phinaliumz at gmail.com"

RUN apt-get update && apt-get -y --no-install-recommends install curl ca-certificates unzip zip enchant libenchant-voikko voikko-fi \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SDKMAN_DIR /usr/local/sdkman

SHELL [ "/bin/bash", "-c"]

RUN curl 'https://get.sdkman.io' | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config

RUN source $SDKMAN_DIR/bin/sdkman-init.sh \
        && sdk install java \
	&& sdk install kotlin \
	&& sdk install kscript

CMD tail -f /dev/null
