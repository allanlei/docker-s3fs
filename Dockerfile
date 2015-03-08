FROM        debian:jessie
MAINTAINER  Allan Lei <allanlei@helveticode.com>

ENV         VERSION 1.78

RUN         apt-get update && \
            apt-get install -y curl build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool pkg-config libssl-dev

RUN         cd $(mktemp -d) && \
            curl -L https://github.com/s3fs-fuse/s3fs-fuse/archive/v$VERSION.tar.gz | tar xvz --strip-components 1 && \
            ./autogen.sh && \
            ./configure --with-openssl && \
            make && \
            make install

RUN         apt-get autoremove -y && \
            apt-get autoclean -y
CMD         ["s3fs"]