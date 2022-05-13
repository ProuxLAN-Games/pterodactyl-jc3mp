FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y git libstdc++6 lib32stdc++6 openssl curl && \
    apt install -y python3.9 && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && \
    apt install -y nodejs && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./install_package.py /home/container/install_package.py
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
