FROM python:3.8-alpine

LABEL "com.github.actions.name"="Sync To S3"
LABEL "com.github.actions.description"="Sync github repository to an AWS S3 bucket"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.0.1"
LABEL repository="https://github.com/eatsteakbewise/synctos3"
LABEL homepage="http://www.eatsteakbewise.com/"
LABEL maintainer="Brian Childers <brian@childers.org>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.18.14'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 config/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
