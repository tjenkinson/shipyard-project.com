.PHONY: all app build build-app build-api build-image build-site api-docs site-docs image release docker-cleanup clean

TAG := latest
REPO := shipyard/shipyard-project.com

all: image

build: build-app build-site build-api

build-docker:
	@docker build -t shipyard-docs-build -f Dockerfile.build .

build-app: build-docker
	@docker run --name shipyard-docs-build-app -d -w /go/src/app shipyard-docs-build bash -c "go build -o server -a -tags "netgo static_build" -installsuffix netgo ."
	@docker wait shipyard-docs-build-app
	@rm -rf server
	@docker cp shipyard-docs-build-app:/go/src/app/server .

build-api: build-docker build-site
	@docker run --name shipyard-docs-build-api -w /slate shipyard-docs-build bash -c "bundle exec middleman build"
	@docker wait shipyard-docs-build-api
	@rm -rf public/docs/api
	@docker cp shipyard-docs-build-api:/slate/build public/docs/api

build-site: build-docker
	@docker run --name shipyard-docs-build-site -d -w /site shipyard-docs-build bash -c "hugo -v"
	@docker wait shipyard-docs-build-site
	@rm -rf public
	@docker cp shipyard-docs-build-site:/site/public .

docker-cleanup:
	@docker rm -fv shipyard-docs-build-app > /dev/null 2>&1 || true
	@docker rm -fv shipyard-docs-build-api > /dev/null 2>&1 || true
	@docker rm -fv shipyard-docs-build-site > /dev/null 2>&1 || true

build-image: build
	@docker build -t $(REPO):$(TAG) .

app: build-app docker-cleanup

api-docs: build-api docker-cleanup

site-docs: build-site docker-cleanup

image: build-image docker-cleanup

clean: docker-cleanup
	@rm -rf public
	@rm -rf server
