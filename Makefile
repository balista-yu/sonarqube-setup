help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
up: ## Start the container
	docker compose up -d
build: ## Build the container
	docker compose build --no-cache --force-rm
stop: ## Stop the container
	docker compose stop
down: ## Down the container
	docker compose down --remove-orphans
down-v: ## Down the container and volumes
	docker compose down --remove-orphans --volumes
destroy: ## Destroy the images
	docker compose down --rmi all --volumes --remove-orphans
ps: ## ps
	docker compose ps
logs: ## Show logs
	docker compose logs
logs-watch:## Watch logs
	docker compose logs --follow
init: ## init
	docker compose up -d --build
