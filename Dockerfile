FROM tindtechnologies/elasticsearch-concatenate-token-filter:1.2.1-1 AS concatplugin
FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.6

COPY --from=concatplugin /usr/src/elasticsearch-concatenate-token-filter/target/releases/elasticsearch-concatenate-1.2.1.zip ./
RUN bin/elasticsearch-plugin install file:///usr/share/elasticsearch/elasticsearch-concatenate-1.2.1.zip && \
    bin/elasticsearch-plugin install analysis-icu

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y dnsutils && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*"
