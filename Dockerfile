FROM tindtechnologies/elasticsearch-concatenate-token-filter:1.2.1 AS concatplugin
FROM docker.elastic.co/elasticsearch/elasticsearch:7.16.1

COPY --from=concatplugin /usr/src/elasticsearch-concatenate-token-filter/target/releases/elasticsearch-concatenate-1.2.1.zip ./
RUN bin/elasticsearch-plugin install file:///usr/share/elasticsearch/elasticsearch-concatenate-1.2.1.zip && \
    bin/elasticsearch-plugin install analysis-icu
