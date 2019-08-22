GIT_COMMIT       := $$(git rev-parse HEAD)
GIT_COMMIT_SHORT := $$(git rev-parse --short HEAD)
#GIT_TAG          := $$(git describe --exact-match)
#GIT_TAG          := $$(git describe)

REPOSITORY     ?= panta/docker-sftp
# TAG            ?= ${GIT_TAG}
TAG            ?= v0.0.1
IMAGE          := $(REPOSITORY):$(TAG)
LATEST         := $(REPOSITORY):latest

OK_COLOR=\033[32;01m
NO_COLOR=\033[0m

.PHONY: all
all: build push

.PHONY: build
build:
	@echo "$(OK_COLOR)==>$(NO_COLOR) Building $(IMAGE)"
	@docker build --rm -t $(IMAGE) .
	@docker tag $(IMAGE) ${LATEST}

.PHONY: push
push:
	@echo "$(OK_COLOR)==>$(NO_COLOR) Pushing $(REPOSITORY):$(TAG)"
	@docker push $(REPOSITORY)
