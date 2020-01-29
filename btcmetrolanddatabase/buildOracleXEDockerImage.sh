#!/usr/bin/env bash
echo "building docker image for oracle 18c xe"
cd docker-oracle-xe

sudo docker network create oracle_network

sudo docker build -t oracle-xe:18c .

sudo docker run -d  -p 32118:1521  -p 35518:5500  --name=oracle-xe  --volume ~/docker/oracle-xe:/opt/oracle/oradata --network=oracle_network  oracle-xe:18c

