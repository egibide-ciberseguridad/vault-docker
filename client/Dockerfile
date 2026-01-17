ARG VAULT_VERSION=latest

FROM hashicorp/vault:${VAULT_VERSION}

RUN apk update && \
    apk add bash curl nano jq iproute2 iputils-ping

ENV PS1='\u@\h:\w\$\040'

RUN touch ~/.bashrc && \
    vault -autocomplete-install

WORKDIR /root
