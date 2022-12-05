#!/bin/bash

docker compose pull homeassistant
docker compose up --build -d homeassistant 
docker image prune -f
