# From: https://github.com/krom/docker-compose-makefile
# REQUIRED SECTION
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
include $(ROOT_DIR)/.mk-lib/common.mk
# END OF REQUIRED SECTION

# THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY: help build up start down destroy stop restart logs logs-ha ps login-ha login-db db-shell

dependencies: check-dependencies ## Check dependencies

build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build $(c)

up:	## Start all or c=<name> containers in foreground
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d $(c)

start:	## Start all or c=<name> containers in background
	docker compose -f $(DOCKER_COMPOSE_FILE) start $(c)

down:	## Stop and remove all or c=<name> containers
	docker compose -f $(DOCKER_COMPOSE_FILE) down $(c)

destroy:## Stop and remove all or c=<name> containers, remove volumes
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v $(c)

stop:	## Stop all or c=<name> containers
	docker compose -f $(DOCKER_COMPOSE_FILE) stop $(c)

restart:## Restart all or c=<name> containers
	docker compose -f $(DOCKER_COMPOSE_FILE) stop $(c)
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d $(c)


update:	## Restart c=<name> container, c is mandatory
	docker compose -f $(DOCKER_COMPOSE_FILE) pull
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d
	docker image prune -f

logs:	## Show logs for all or c=<name> containers
	docker compose -f $(DOCKER_COMPOSE_FILE) logs --tail=100 -f $(c)

logs-ha:## Show logs for <ha> container
	docker compose -f $(DOCKER_COMPOSE_FILE) logs --tail=100 -f ha

ps:	## Show status of containers
	docker compose -f $(DOCKER_COMPOSE_FILE) ps

login-ha:
	docker compose -f $(DOCKER_COMPOSE_FILE) exec ha /bin/bash

login-db:
	docker compose -f $(DOCKER_COMPOSE_FILE) exec db /bin/bash

db-shell:
	docker compose -f $(DOCKER_COMPOSE_FILE) exec db mysql --user=homeassistant

