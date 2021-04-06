#
# To build this Docker image: docker build -t fpm .
#
# To run this Docker container interactively: docker run -it fpm
#
FROM debian:buster

RUN apt update && apt -y install \
        ruby \
        ruby-dev \
        rubygems \
        build-essential \
        git \
    && gem install --no-document fpm

# see also https://github.com/jordansissel/fpm/pull/1753