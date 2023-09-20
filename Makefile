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
	docker run $(DOCKER_IMAGE)

# CI target
.PHONY: ci
ci: lint test build run