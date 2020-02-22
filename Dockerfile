FROM alpine:3.11

MAINTAINER Tamas Foldi <tfoldi@starschema.net>

COPY tabpy.conf requirements.txt ./

# based on faizanbashir/python-datascience
ENV PACKAGES="\
    dumb-init \
    musl \
    libc6-compat \
    freetype \
    libgfortran \
    libstdc++ \
    openblas \
    tcl \
    tk \
    py3-numpy \
    py3-pip \
    py3-scipy \
    libffi \
    libselinux-utils \
    cython \
    libressl \
    libgomp \
    libressl3.0-libssl \
    python3 \
"

ENV BUILD_PACKAGES="\
    linux-headers \
    build-base \
    git \
    bash \
    ca-certificates \
    libgcc \
    gfortran \
    cmake \
    freetype-dev \
    libstdc++ \
    libffi-dev \
    py3-numpy-dev \
    python3-dev \
    libressl-dev \
    openblas-dev \
"

# TODO: add/remove virtual packages 
RUN apk add --no-cache $PACKAGES \
  && apk add --no-cache --virtual build-deps $BUILD_PACKAGES \
  && rm -rf /var/cache/apk/* \
  && adduser -h /tabpy -D -u 1000  tabpy \
  && pip3 install --no-cache-dir -r requirements.txt  \
  && su tabpy -c "python3 -m textblob.download_corpora lite && python3 -m nltk.downloader vader_lexicon" \
  && su -c "tabpy --config ./tabpy.conf & (sleep 1 && tabpy-deploy-models) && killall tabpy" \
  && apk del build-deps 

USER 1000:1000
EXPOSE 9004

CMD [ "tabpy", "--config=./tabpy.conf" ]

