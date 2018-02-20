#!/bin/bash
docker-compose down
rm -rf ncs-run
docker-compose build
docker-compose run nso bash
