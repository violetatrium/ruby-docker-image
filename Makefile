VERSION?=$(shell git describe --tags 2> /dev/null || echo '0.0.0')
DOCKER_IMAGE=minimsecure/ruby-docker-image
ASSET_BUILDER=minimsecure/assetbuilder

.PHONY: image
image:
	docker build \
		--no-cache \
		-t $(DOCKER_IMAGE):$(VERSION)-slim \
		-f Dockerfile.slim \
		.

.PHONY: docker/push
docker/push:
	@docker push $(DOCKER_IMAGE):$(VERSION)-slim
	@docker push $(DOCKER_IMAGE):latest
