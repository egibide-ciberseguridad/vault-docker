ARG VAULT_VERSION=latest

FROM hashicorp/vault:${VAULT_VERSION}

USER root

RUN apk update && \
    apk add bash curl nano jq iproute2 iputils-ping

USER vault

ENV PS1='\u@\h:\w\$\040'

RUN echo "complete -C /bin/vault vault" > /home/vault/.bashrc

WORKDIR /home/vault
