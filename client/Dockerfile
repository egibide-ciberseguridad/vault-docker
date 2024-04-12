FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y software-properties-common curl gnupg2

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - &&  \
    apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get install -y vault

RUN setcap cap_ipc_lock= /usr/bin/vault

RUN apt-get install -y nano jq
