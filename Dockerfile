FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y git libstdc++6 lib32stdc++6 openssl curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && \
    apt install -y nodejs
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./start.sh /home/container/start.sh
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
