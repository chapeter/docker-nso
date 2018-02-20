#!/bin/bash
docker-compose down
rm -rf ncs-run
mkdir ncs-run
touch ncs-run/.ignore
docker-compose build
docker-compose run nso bash
