DOCKER_IMAGE="twstrike/coyim-testing"

default:
	behave

deps:
	pip install behave

test: coyim-bin
	sudo docker run -t \
		-v $(shell pwd):/src \
		-v $(shell pwd)/dogtail-root:/tmp/dogtail-root \
		-e COYIM_PATH=/src/coyim-bin \
		$(DOCKER_IMAGE) behave

docker-build:
	sudo docker build -t $(DOCKER_IMAGE) .

docker-term:
	sudo docker run -it -v $(shell pwd):/src $(DOCKER_IMAGE) /bin/bash

docker-run: coyim-bin
	sudo docker run -it \
		-v $(shell pwd):/src \
		-v $(shell pwd)/dogtail-root:/tmp/dogtail-root \
		-e COYIM_PATH=/src/coyim-bin \
		$(DOCKER_IMAGE) $(RUN)

coyim-bin:
	sudo docker run -t \
		-v $(shell pwd):/src \
		-v $(shell pwd)/dogtail-root:/tmp/dogtail-root \
		-e COYIM_PATH=/src/coyim-bin \
		$(DOCKER_IMAGE) /bin/build-coy

