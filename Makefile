ADMIN_EMAIL ?= $(shell bash -c 'read -p "Administrator/PGAdmin admin_email: " admin_email; echo $$admin_email')
ADMIN_PASSWORD ?= $(shell bash -c 'read -p "Administrator/PGAdmin admin_password: " admin_password; echo $$admin_password')
POSTGRES_USER ?= $(shell bash -c 'read -p "Postgresql username: " postgres_user; echo $$postgres_user')
POSTGRES_PASSWORD ?= $(shell bash -c 'read -p "Postgresql password postgres_password: " postgres_password; echo $$postgres_password')
REDIS_PASSWORD ?= $(shell bash -c 'read -p "Redis password redis_password: " redis_password; echo $$redis_password')

setup:
	@clear
	@test -f .env || cp .env.example .env

	@sed -i 's/{{ADMIN_EMAIL}}/${ADMIN_EMAIL}/g' .env
	@sed -i 's/{{ADMIN_PASSWORD}}/${ADMIN_PASSWORD}/g' .env
	@sed -i 's/{{POSTGRES_USER}}/${POSTGRES_USER}/g' .env
	@sed -i 's/{{POSTGRES_PASSWORD}}/${POSTGRES_PASSWORD}/g' .env
	@sed -i 's/{{REDIS_PASSWORD}}/${REDIS_PASSWORD}/g' .env

	@curl -fsSL https://bun.sh/install | bash

	@bun install
	@bun run ./database/setup.ts

start:
	@docker compose up -d

stop:
	@docker compose down

help:
	@echo "Commands: setup, start, stop"