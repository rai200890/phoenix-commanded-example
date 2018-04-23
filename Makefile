.PHONY: build test up down test

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
