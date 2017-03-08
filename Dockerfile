FROM docker.elastic.co/elasticsearch/elasticsearch:5.2.0

RUN bin/elasticsearch-plugin install -b io.fabric8:elasticsearch-cloud-kubernetes:5.2.0

ENV BOOTSTRAP_MLOCKALL=false NODE_DATA=true NODE_MASTER=true ES_JAVA_OPTS=-Djava.net.preferIPv4Stack=true

ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch
