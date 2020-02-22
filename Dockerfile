FROM faizanbashir/python-datascience

MAINTAINER Tamas Foldi <tfoldi@starschema.net>

COPY tabpy.conf requirements.txt ./

RUN apk add --no-cache libffi-dev python3-dev libressl-dev \
	&& rm -rf /var/cache/apk/* \
  && adduser -h /tabpy -D -u 1000  tabpy

RUN pip install --no-cache-dir -r requirements.txt 

# Took this from https://github.com/erichannell/TabPy-docker
RUN su tabpy -c "python -m textblob.download_corpora lite && python -m nltk.downloader vader_lexicon"

USER 1000:1000
EXPOSE 9004

CMD [ "tabpy", "--config=./tabpy.conf" ]

