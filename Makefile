APP = restapi

test:
	@pytest -v --disable-warnings

compose:
	@docker container prune
	@docker-compose build
	@docker-compose up