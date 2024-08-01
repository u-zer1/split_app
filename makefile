# Определение переменных
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = docker-compose.yml
.DEFAULT_GOAL := help

# Задача по умолчанию
default: build up

# Сборка образов
build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

# Запуск контейнеров
up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Остановка и удаление контейнеров
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# Пересборка образов и перезапуск контейнеров
restart: down build up

# Просмотр логов
logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Запуск тестов (если есть)
test:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) run --rm react-app npm test

# Удаление образов
clean:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes


# Target to remove all Docker containers, images, volumes, and networks
cleanup:
	@echo "Stopping all containers..."
	docker stop $$(docker ps -aq) || true
	@echo "Removing all containers..."
	docker rm $$(docker ps -aq) || true
	@echo "Removing all images..."
	docker rmi $$(docker images -q) || true
	@echo "Removing all volumes..."
	docker volume rm $$(docker volume ls -q) || true
	@echo "Removing all networks..."
	docker network rm $$(docker network ls -q) || true
	@echo "Removing all unused Docker resources..."
	docker system prune -a --volumes -f || true

# Help target
help:
	@echo "Usage:"
	@echo "  make cleanup  - Remove all Docker containers, images, volumes, and networks"