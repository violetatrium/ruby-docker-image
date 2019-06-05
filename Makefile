VERSION?=$(shell git describe --tags 2> /dev/null || echo '0.0.0')
DOCKER_IMAGE=minimsecure/ruby-docker-image

.PHONY: image
image:
	docker build \
		-t minimsecure/ruby-docker-image:$(VERSION) \
		-t $(DOCKER_IMAGE):latest \
		-f Dockerfile \
		.

.PHONY: image/alpine
image/alpine:
	docker build \
		-t $(DOCKER_IMAGE)-alpine:$(VERSION) \
		-t $(DOCKER_IMAGE)-alpine:latest \
		-f Dockerfile.alpine \
		.

.PHONY: images
images: image image/alpine

.PHONY: docker/push/latest
docker/push/version:
	@docker push $(DOCKER_IMAGE):latest
	@docker push $(DOCKER_IMAGE)-alpine:latest

.PHONY: docker/push/version
docker/push/version:
	@docker push $(DOCKER_IMAGE):$(VERSION)
	@docker push $(DOCKER_IMAGE)-alpine:$(VERSION)

.PHONY: docker/push
docker/push: docker/push/version docker/push/latest
