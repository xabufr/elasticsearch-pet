FROM elasticsearch:5.1.1

RUN bin/elasticsearch-plugin install -b io.fabric8:elasticsearch-cloud-kubernetes:5.1.1
RUN bin/elasticsearch-plugin install -b x-pack

# pre-stop-hook.sh and dependencies
RUN apt-get update && apt-get install -y \
    jq \
    curl \
 && rm -rf /var/lib/apt/lists/*

ENV BOOTSTRAP_MLOCKALL=false NODE_DATA=true NODE_MASTER=true ES_JAVA_OPTS=-Djava.net.preferIPv4Stack=true

COPY pre-stop-hook.sh /pre-stop-hook.sh

ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
