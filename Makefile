build: down
	docker-compose up --build

up: down
	docker-compose up

down:
	docker-compose down -v --remove-orphans

test:
	docker-compose run --rm --no-deps web mix test --trace
