FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get upgrade -y 

RUN apt-get install -y \
    vim \
    tmux \
    git \
    sudo \
    python3 \
    python3-pip \
    curl

RUN curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
RUN tar xvf go1.6.linux-amd64.tar.gz

RUN mv go /usr/local

ENV GOPATH $HOME/work
ENV PATH=$PATH:/usr/local/go/bin:${GOPATH}/bin

RUN mkdir -p /mount


WORKDIR /mount
RUN git clone https://github.com/ethanjwright/dotfiles
WORKDIR /mount/dotfiles/bin
RUN ./other_setup_all.sh

COPY . .

WORKDIR /mount

CMD ["/bin/bash"]
