all: build-debian

build-image:
	docker build -t pyais-debian . -f Dockerfile --build-arg distro=ubuntu:jammy

pull-sources:
	# NOTE: --branch <tag-name> should match the expected tag.
	rm -rf ./source
	git clone --depth 1 --branch v2.5.6 https://github.com/M0r13n/pyais.git ./source/
	cp -r debian ./source/

build-debian: build-image
	(DOCKER_CONTENT_TRUST=0; docker run --rm -v "$(CURDIR)/source:/source-ro:ro"  -v "$(CURDIR)/output:/output"  -v "$(CURDIR)/buildhelper.sh:/buildhelper.sh:ro" pyais-debian ./buildhelper.sh)
