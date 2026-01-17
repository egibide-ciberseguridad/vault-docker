ARG VAULT_VERSION=latest

FROM hashicorp/vault:${VAULT_VERSION}

RUN apk update && \
    apk add bash curl nano jq

ENV PS1='\u@\h:\w\$\040'
