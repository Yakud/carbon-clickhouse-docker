FROM golang:1.9.3-stretch

ENV GIT_REPO=https://github.com/lomik/carbon-clickhouse.git
ENV GIT_TAG=v0.6.3

RUN git clone ${GIT_REPO} && \
    cd carbon-clickhouse && \
    git checkout tags/${GIT_TAG} && \
    make submodules && \
    make

RUN mkdir -p /go/bin && \
    mv /go/carbon-clickhouse/carbon-clickhouse /go/bin/carbon-clickhouse && \
    chmod 775 /go/bin/carbon-clickhouse

RUN mkdir -p /data/carbon-clickhouse && \
    mkdir -p /var/log/carbon-clickhouse && \
    mkdir -p /etc/carbon-clickhouse

# Add default config
ADD config.conf /etc/carbon-clickhouse/config.conf

EXPOSE 2003
EXPOSE 2004
EXPOSE 2005
EXPOSE 7007

VOLUME /data/carbon-clickhouse

ENTRYPOINT ["/go/bin/carbon-clickhouse", "-config=/etc/carbon-clickhouse/config.conf"]
