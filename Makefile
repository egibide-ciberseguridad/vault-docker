#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo --------------------------------
	@echo build
	@echo start / stop / restart
	@echo workspace
	@echo stats
	@echo logs / server-logs / client-logs
	@echo clean
	@echo --------------------------------

_header:
	@echo -----
	@echo Vault
	@echo -----

build:
	@docker compose build --pull

start:
	@docker compose up -d --remove-orphans

stop:
	@docker compose stop

restart: stop start

workspace:
	@docker compose run --rm --service-ports vault-client /bin/bash

stats:
	@docker stats

logs server-logs:
	@docker compose logs vault-server

client-logs:
	@docker compose logs vault-client

clean:
	@docker compose down -v --remove-orphans
