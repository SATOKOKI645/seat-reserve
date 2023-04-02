# Dockerイメージ名
IMAGE_NAME = ruby
# Dockerfileのパス
DOCKERFILE_PATH = ./docker/ruby/Dockerfile
# DockerComposeコマンド
DOCKER_COMPOSE = docker-compose

# イメージをビルドする(gemなど入れ直したらやる)
# buildした後はupしてください
.PHONY: build
build:
	$(DOCKER_COMPOSE) build

# Dockerfile更新時にキャッシュ不使用してイメージをビルドする
.PHONY: build-no-cache
build-no-cache:
	$(DOCKER_COMPOSE) build --no-cache

# コンテナを起動する
.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d --build

# コンテナを停止する
.PHONY: stop
stop:
	$(DOCKER_COMPOSE) stop

# コンテナを開始する
.PHONY: start
start:
	$(DOCKER_COMPOSE) start

# コンテナを単体で実行する
.PHONY: run
run:
	$(DOCKER_COMPOSE) run -it --rm -p 8080:8080 $(IMAGE_NAME)

# Dockerイメージを削除する
.PHONY: clean
clean:
	docker rmi $(IMAGE_NAME)

# Dockerコンテナにシェルで接続する
.PHONY: shell
shell:
	$(DOCKER_COMPOSE) exec $(IMAGE_NAME) /bin/bash
