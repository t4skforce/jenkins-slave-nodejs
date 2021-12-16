FROM t4skforce/jenkins-slave

ARG BUILD_DATE="2021-12-16T22:09:15Z"

USER root

WORKDIR /tmp/
RUN set -xe \
  && apt-get update -qqy || apt-get --only-upgrade install ca-certificates -y && apt-get update -qqy \
  && apt-get -qqy install curl software-properties-common \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get -qqy install nodejs \
  && npm install -g npm-cli-login \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && chown -R jenkins:jenkins /home/jenkins
WORKDIR /home/jenkins
VOLUME ["/home/jenkins/.npm"]
USER jenkins
