.PHONY: build test up down test shell

build: down
	docker-compose up --build

up: down
	docker-compose up

down:
	docker-compose down -v --remove-orphans

test:
	docker-compose run --rm --no-deps web mix test --trace

setup-eventstore:
	 docker-compose run --rm --no-deps web mix do event_store.create, event_store.init

shell:
	docker-compose run --rm --no-deps web bash

format:
	docker-compose run --rm --no-deps web mix format

lint:
	docker-compose run --rm --no-deps web mix credo --strict
