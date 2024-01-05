#!/bin/bash

# Test with some delay
sleep 30

# Run the command to generate the unicast_hosts.txt file
dig SRV elasticsearch.elasticsearch.internal | awk '/IN SRV/ {print $8 ":" $7}' | sed 's/\.:/:/g' > /usr/share/elasticsearch/config/unicast_hosts.txt

# Check if the file was created successfully
if [ ! -s /usr/share/elasticsearch/config/unicast_hosts.txt ]; then
    echo "Failed to create unicast_hosts.txt, exiting."
    exit 1
fi

# Execute the original Elasticsearch entrypoint script with any arguments passed to this script
exec /usr/local/bin/docker-entrypoint.sh "$@"
