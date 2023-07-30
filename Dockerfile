ARG distro="ubuntu:latest"

FROM ${distro}

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-all \
    python3-setuptools \
    python3-pip \
    python3-attr \
    python3-bitarray \
    dh-python \
    debhelper \
    build-essential
