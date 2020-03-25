FROM adoptopenjdk:8u242-b08-jre-hotspot-bionic

MAINTAINER Nikita Konev <nikit.cpp@yandex.ru>

ARG H2_VERSION=1.4.200

EXPOSE 8082 9092

ENV H2DATA /h2-data
VOLUME $H2DATA

WORKDIR /

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

ENV DOWNLOAD https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar
ENV H2_JAR /h2.jar
RUN curl ${DOWNLOAD} -Sso $H2_JAR
