FROM t4skforce/jenkins-slave

ARG BUILD_DATE=""

USER root

WORKDIR /tmp/
RUN set -xe \
  && apt-get update -qqy \
  && apt-get -qqy install curl software-properties-common \
  && curl -skL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get -qqy install nodejs \
  && npm install -g npm-cli-login \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && chown -R jenkins:jenkins /home/jenkins
WORKDIR /home/jenkins
VOLUME ["/home/jenkins/.npm"]
USER jenkins
