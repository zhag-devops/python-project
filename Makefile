# Docker image name and tag
DOCKER_IMAGE := python-project

# Define default target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  ci         - Run lint, test, build,run"
	@echo "  lint       - Run linting checks"
	@echo "  test       - Run unit tests"
	@echo "  build      - Build the Docker image"
	@echo "  run        - Run the Docker container"
	@echo "  install    - Install in dev environment"
	@echo "  clean      - Delete __pycache__ and etc"
	@echo "  pre-commit - Activate pre-commit"
	@echo "  help       - Display this help message"

# Lint target
.PHONY: lint
lint:
	docker build --target lint -f Containerfile .

# Test target
.PHONY: test
test:
	docker build --target test -f Containerfile .

# Build target
.PHONY: build
build:
	docker build --target build -t $(DOCKER_IMAGE) -f Containerfile .

# Run target
.PHONY: run
run:
	@if [ -f .env ]; then \
		echo "Running Docker with .env file..."; \
		docker run --env-file .env $(DOCKER_IMAGE); \
	else \
		echo "Running Docker without .env file..."; \
		docker run $(DOCKER_IMAGE); \
	fi

# CI target
.PHONY: ci
ci: lint test build run

.PHONY: install
install:
	@read -p "Do you want to install? (Y/N): " choice; \
	if [ "$$choice" = "Y" ]; then \
		python3 -m venv .venv && \
		. .venv/bin/activate && \
		pip3 install -r requirements.txt && \
		poetry install; \
	else \
		echo "Installation aborted."; \
	fi

.PHONY: clean
clean:
	@echo "Cleaning up __pycache__ folders..."
	find . -name "__pycache__" -type d -exec rm -r {} +
	find . -name ".mypy_cache" -type d -exec rm -r {} +
	@echo "Cleanup complete."


.PHONY: pre-commit
pre-commit:
	@read -p "Do you want to activate pre-commit? (Y/N): " choice; \
	if [ "$$choice" = "Y" ]; then \
		python3 -m venv .venv && \
		. .venv/bin/activate && \
		pre-commit install --hook-type pre-commit --hook-type pre-push; \
	else \
		echo "Installation aborted."; \
	fi
