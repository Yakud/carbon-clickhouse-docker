NAME:=carbon-clickhouse-docker
MAINTAINER:="Aleksei Kiselev <yakudgm@gmail.com>"
DESCRIPTION:="carbon-clickhouse docker image"

all: build

build:
	docker build -t yakud/carbon-clickhouse .