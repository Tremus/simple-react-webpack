# BASICS
.PHONY: show
show:
	docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'

.PHONY: view
view:
	docker-compose logs -f --tail=10

.PHONY: build
build:
	docker-compose build
	make up

.PHONY: up
up:
	docker-compose up -d
	make show

.PHONY: rm
rm:
	docker-compose rm -sf

.PHONY: re
re:
	make rm
	make up
	make view

# CONTAINER SPECIFIC
.PHONY: node
node:
	docker run -v `pwd`/node/:/node --rm -it node:alpine sh

.PHONY: client
client:
	docker-compose exec client sh

.PHONY: r-client
r-client:
	docker-compose restart client
