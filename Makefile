# Makefile to automate tasks

# Define the default target
.DEFAULT_GOAL := help

build:
# Variables
ENV_FILE := .env

# Check if .env file exists and copy .env.example if it doesn't
$(ENV_FILE):
    @test -f $(ENV_FILE) || cp .env.example $(ENV_FILE)

	@bun run start

# Target to run the TypeScript file
run:
    

# Target to build the Docker Compose services
docker-build:
    @docker-compose build

# Help target
help:
    @echo "Available targets:"
    @echo "  make run          - Run the TypeScript file"
    @echo "  make docker-build - Build the Docker Compose services"