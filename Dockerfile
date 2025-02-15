FROM openjdk:19-jdk-alpine3.16

ENV REVIEWDOG_VERSION=v0.14.1

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk add --no-cache git
COPY entrypoint.sh /entrypoint.sh
COPY hivecloud_checks.xml /hivecloud_checks.xml

ENTRYPOINT ["/entrypoint.sh"]
