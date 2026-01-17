ARG DEBIAN_VERSION=12

FROM debian:${DEBIAN_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        gnupg \
        ca-certificates \
        libcap2-bin \
        bash-completion \
        nano \
        jq \
        iproute2 \
        iputils-ping && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN CODENAME="$(. /etc/os-release && echo "${VERSION_CODENAME:-bookworm}")" && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com ${CODENAME} main" > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && apt-get install -y --no-install-recommends vault && \
    rm -rf /var/lib/apt/lists/*

RUN setcap cap_ipc_lock= /usr/bin/vault

RUN touch ~/.bashrc && \
    vault -autocomplete-install

WORKDIR /root
