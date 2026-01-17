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
	@echo -----------------
	@echo build
	@echo start / start-dev
	@echo stop / restart
	@echo workspace
	@echo logs
	@echo stats
	@echo clean
	@echo -----------------

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
	@docker compose up -d --remove-orphans vault-server

_start-command-production:
	@docker compose -f docker-compose.yml -f docker-compose.production.yml up -d --remove-orphans vault-server

start-dev: _header _start-command _urls

start: _header _start-command-production _urls

stop:
	@docker compose stop

restart: stop start

workspace:
	@COMPOSE_PROGRESS=quiet docker compose run --rm --service-ports vault-client /bin/bash

logs:
	@docker compose logs vault-server

stats:
	@docker stats

clean:
	@docker compose -f docker-compose.yml -f docker-compose.production.yml down -v --remove-orphans
