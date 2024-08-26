APP = restapi

compose:
	@docker container prune
	@docker-compose build
	@docker-compose up