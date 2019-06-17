VERSION?=$(shell git describe --tags 2> /dev/null || echo '0.0.0')
DOCKER_IMAGE=minimsecure/ruby-docker-image

.PHONY: image
image:
	docker build \
		-t $(DOCKER_IMAGE):$(VERSION) \
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

.PHONY: docker/push/alpine
docker/push/alpine:
	@docker push $(DOCKER_IMAGE)-alpine:$(VERSION)
	@docker push $(DOCKER_IMAGE)-alpine:latest

.PHONY: docker/push/image
docker/push/image:
	@docker push $(DOCKER_IMAGE):$(VERSION)
	@docker push $(DOCKER_IMAGE):latest

.PHONY: docker/push
docker/push: docker/push/alpine docker/push/image
