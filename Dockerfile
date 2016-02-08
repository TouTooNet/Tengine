# this ubuntu 14.04 base system
FROM ubuntu:14.04

MAINTAINER SimMan <liwei0990@gmail.com>

# Base build
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget git vim build-essential libpcre3 libpcre3-dev openssl libssl-dev curl zsh htop unzip python-setuptools pwgen
RUN ln -s /usr/bin/make /usr/bin/gmake
