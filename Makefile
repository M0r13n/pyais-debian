all: build-debian

build-imgage:
	docker build -t pyais-debian . -f Dockerfile.build --build-arg distro=ubuntu:jammy

pull-sources:
	# NOTE: --branch <tag-name> should match the expected tag
	git clone --depth 1 --branch v2.5.6 https://github.com/M0r13n/pyais.git ./sources

build-debian: build-image pull-sources
	(DOCKER_CONTENT_TRUST=0; docker run --rm -v "$(CURDIR)/source:/source-ro:ro"  -v "$(CURDIR)/output:/output"  -v "$(CURDIR)/buildhelper.sh:/buildhelper.sh:ro" pyais-debian ./buildhelper.sh)
