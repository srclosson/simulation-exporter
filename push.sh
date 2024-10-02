#!/bin/bash

docker tag $1 harbor.srclos.zone/prometheus/simulation-exporter:latest
docker push harbor.srclos.zone/prometheus/simulation-exporter:latest