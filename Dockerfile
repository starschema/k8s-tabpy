FROM faizanbashir/python-datascience

COPY requirements.txt ./

RUN apk add --no-cache libffi-dev python3-dev libressl-dev \
	&& rm -rf /var/cache/apk/*

RUN pip install --no-cache-dir -r requirements.txt

# Took this from https://github.com/erichannell/TabPy-docker/blob/master/Dockerfile
RUN python -m textblob.download_corpora lite && python -m nltk.downloader vader_lexicon



CMD [ "tabpy" ]
