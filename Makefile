VERSION?=$(shell git describe --tags 2> /dev/null || echo '0.0.0')
DOCKER_IMAGE=minimsecure/ruby-docker-image
ASSET_BUILDER=minimsecure/assetbuilder

# This is the old (bloated) image
.PHONY: image
image:
	docker build \
		-t $(DOCKER_IMAGE):$(VERSION) \
		-t $(DOCKER_IMAGE):latest \
		-f Dockerfile \
		.

# This is the new image we are using because we can't use alpine
# due to glibc compatibility issues
.PHONY: image/slim
image/slim:
	docker build \
		-t $(DOCKER_IMAGE):$(VERSION)-slim \
		-f Dockerfile.slim \
		.

.PHONY: images
images: image image/slim

.PHONY: docker/push/slim
docker/push/slim:
	@docker push $(DOCKER_IMAGE):$(VERSION)-slim

.PHONY: docker/push/image
docker/push/image:
	@docker push $(DOCKER_IMAGE):$(VERSION)
	@docker push $(DOCKER_IMAGE):latest

.PHONY: docker/push
docker/push: docker/push/slim docker/push/image
