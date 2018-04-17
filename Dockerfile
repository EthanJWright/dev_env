FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get upgrade -y 

RUN apt-get install -y \
    vim \
    tmux \
    git \
    sudo \
    python3 \
    python3-pip \

RUN curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
RUN tar xvf go1.6.linux-amd64.tar.gz

ENV GOPATH $HOME/work
RUN export PATH=$PATH:/usr/local/go/bin:${GOPATH}/bin

RUN mkdir -p /home/god


WORKDIR /home/god/
RUN git clone https://github.com/ethanjwright/dotfiles
WORKDIR /home/god/dotfiles/bin
RUN ./other_setup_all.sh

COPY . .

CMD ["/bin/bash"]
