FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt-get install curl openjdk-8-jdk vim apt-transport-https wget libdigest-sha-perl -y

RUN useradd -ms /bin/bash es
USER es
WORKDIR /home/es

EXPOSE 9200

ENV VERSION=7.13.3

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$VERSION-linux-x86_64.tar.gz
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$VERSION-linux-x86_64.tar.gz.sha512
RUN shasum -a 512 -c elasticsearch-$VERSION-linux-x86_64.tar.gz.sha512
RUN tar -xzf elasticsearch-$VERSION-linux-x86_64.tar.gz
RUN rm elasticsearch-$VERSION-linux-x86_64.tar.gz

CMD ["/home/es/elasticsearch-$VERSION/bin/elasticsearch"]
