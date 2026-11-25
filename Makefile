#!make
include .env
export $(shell sed 's/=.*//' .env)

echo-envs:
	@bash -c "echo ${ADMIN_BRANCH}"

chmod-uspider-admin:
	@bash -c "chmod -R 777 uspider-admin"

clone-admin:
	@echo "\n\033[01;33m Cloning admin repository (${ADMIN_BRANCH} branch) \033[0m"
	@bash -c "if [ -d ./uspider-admin ]; then cd ./uspider-admin && git fetch && git checkout ${ADMIN_BRANCH} && git reset --hard origin/${ADMIN_BRANCH}; else git clone -b ${ADMIN_BRANCH} ${ADMIN_GIT_URL} ./uspider-admin; fi"

build-nginx-image:
	docker-compose build

build-admin-image:
	docker build -t uspider-admin:latest ./uspider-admin

admin-up:
	docker-compose up --remove-orphans -d

admin-down:
	docker-compose down -v

admin-repo:
	docker volume create admin-repo