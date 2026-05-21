ARG VAULT_VERSION=latest

FROM hashicorp/vault:${VAULT_VERSION}

USER root

RUN apk update && \
    apk add bash curl nano jq

USER vault

ENV PS1='\u@\h:\w\$\040'
