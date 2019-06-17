# ruby-docker-image
This is the Minim base docker image that is bassed off of the base Ruby docker iamge.

There are two Dockerfiles, one builds an image based on the `ruby:<version>`
docker image, the other on the `ruby:<version>-alpine<alpine-version>`.

## Building
```
# To build the ruby docker image
$ make image

# To build the alpine image
$ make image/alpine
```

Use the `VERSION` environment variable to build a specific tag
```
$ VERSION=1.1.1 make image
$ VERSION=1.1.1 make image/alpine
```

All builds will tag the version as well as `latest`.

## Pushing Image
To push the image to docker hub:
```
# To push the latest versions
$ make docker/push/latest

# To push the tagged versions
$ make docker/push/version

# To push both
$ make docker/push
```
