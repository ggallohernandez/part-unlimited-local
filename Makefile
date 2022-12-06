COMPOSE_EXISTS := $(shell command -v docker-compose)
COMPOSE_V2_EXISTS := $(shell command -v docker compose)

ifneq ($(COMPOSE_EXISTS),)
	DOCKER_COMPOSE=docker-compose
endif

ifneq ($(COMPOSE_V2_EXISTS),)
	DOCKER_COMPOSE=docker compose
endif

# default target to build and start the app
default: build start
all: default migrate collectstatic loaddata test
# build the app with docker-compose
build:
	$(DOCKER_COMPOSE) build

# start the app with docker-compose
start:
	$(DOCKER_COMPOSE) up -d

# stop the app with docker-compose
stop:
	$(DOCKER_COMPOSE) stop

# run migrations with docker-compose
migrate:
	$(DOCKER_COMPOSE) exec parts-api python manage.py migrate

# run collectstatic with docker-compose
collectstatic:
	$(DOCKER_COMPOSE) exec parts-api python manage.py collectstatic

# run loaddata with docker-compose
loaddata:
	$(DOCKER_COMPOSE) exec parts-api python manage.py loaddata parts/fixtures/initial_parts.json

# run tests with docker-compose
test:
	$(DOCKER_COMPOSE) exec parts-api python manage.py test

# open a shell in the web container with docker-compose
shell:
	$(DOCKER_COMPOSE) exec parts-api shell_plus
