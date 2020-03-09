#!/usr/bin/env bash

if [[ ! -f /kafka/config/server.properties.default ]]; then
  cp /kafka/config/server.properties /kafka/config/server.properties.default
fi

env | grep ^KAFKA__ | while read -r var;
do
  if [[ "${var}" =~ ^KAFKA__([^=]+)=(.*)$ ]]; then
    key="${BASH_REMATCH[1]}"
    value="${BASH_REMATCH[2]}"
    sed -i -e "s!#\?${key}=.*!${key}=${value}!" /kafka/config/server.properties
  fi
done

exec /kafka/bin/kafka-server-start.sh /kafka/config/server.properties
