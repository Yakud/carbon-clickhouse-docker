FROM golang:1.9.3-stretch

RUN git clone https://github.com/lomik/carbon-clickhouse.git && \
    cd carbon-clickhouse && \
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
