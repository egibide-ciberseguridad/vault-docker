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
	@echo -----------------------------------
	@echo build
	@echo start / stop / restart
	@echo workspace-client / workspace-server
	@echo stats
	@echo logs / server-logs / client-logs
	@echo clean
	@echo -----------------------------------

_header:
	@echo -----
	@echo Vault
	@echo -----

_urls: _header
	${info }
	@echo --------------------------------
	@echo [Vault UI] http://localhost:8200
	@echo --------------------------------

build:
	@docker compose build --pull

_start-command:
	@docker compose up -d --remove-orphans

start: _header _start-command _urls

stop:
	@docker compose stop

restart: stop start

workspace-client:
	@docker compose run --rm --service-ports vault-client /bin/bash

workspace-server:
	@docker compose exec vault-server /bin/sh

stats:
	@docker stats

logs server-logs:
	@docker compose logs vault-server

client-logs:
	@docker compose logs vault-client

clean:
	@docker compose down -v --remove-orphans
