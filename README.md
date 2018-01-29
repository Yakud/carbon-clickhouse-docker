# carbon-clickhouse-docker
Docker image for [carbon-clickhouse](https://github.com/lomik/carbon-clickhouse)

## Build
```sh
# Build docker image
git clone https://github.com/Yakud/carbon-clickhouse-docker.git
cd carbon-clickhouse-docker
make
```

## Run
### Run with default config
```sh
docker run -d \
    --name=some-carbon-clickhouse \
    -p 2003:2003 \
    -p 2004:2004 \
    -p 2005:2005 \
    -p 7007:7007 \
    yakud/carbon-clickhouse-docker
```

### Run with custom config
```sh
docker run -d \
    --name=some-carbon-clickhouse \
    --volume=./local-conf.conf:/etc/carbon-clickhouse/config.conf
    -p 2003:2003 \
    -p 2004:2004 \
    -p 2005:2005 \
    -p 7007:7007 \
    yakud/carbon-clickhouse-docker
```

### Run with data volume
```sh
docker run -d \
    --name=some-carbon-clickhouse \
    --volume=./local-folder/carbon-clickhouse:/data/carbon-clickhouse
    -p 2003:2003 \
    -p 2004:2004 \
    -p 2005:2005 \
    -p 7007:7007 \
    yakud/carbon-clickhouse-docker
```