# this ubuntu 14.04 base system
FROM ubuntu:14.04

MAINTAINER SimMan <liwei0990@gmail.com>

# Update apt source
ADD sources.list /etc/apt/

# Base build 
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget git vim build-essential libpcre3 libpcre3-dev openssl libssl-dev curl zsh htop unzip python-setuptools pwgen
RUN ln -s /usr/bin/make /usr/bin/gmake
RUN chsh -s /usr/bin/zsh 
ENV SHELL /usr/bin/zsh

# INSTALL ZSH
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set sys time
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set Vim Config
ADD vimrc /etc/vim/vimrc

# Supervisor Config
RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout
ADD ./supervisord.conf /etc/supervisord.conf

# config workdir
WORKDIR /home

# INSTALL LUAJIT
RUN wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz
RUN tar zxvf LuaJIT-2.0.4.tar.gz
RUN cd LuaJIT-2.0.4 && make && make install

# install ngx_devel_kit
RUN wget https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz
RUN tar xzvf v0.2.19.tar.gz

# ngx_lua
RUN wget https://github.com/openresty/lua-nginx-module/archive/v0.9.16rc1.tar.gz
RUN tar xzvf v0.9.16rc1.tar.gz

# set env
ENV LUAJIT_LIB=/usr/local/lib
ENV LUAJIT_INC=/usr/local/include/luajit-2.0
ENV LD_LIBRARY_PATH=/usr/local/lib/:/opt/drizzle/lib/:$LD_LIBRARY_PATH

# INSTALL tengine
RUN wget http://tengine.taobao.org/download/tengine-2.1.2.tar.gz
RUN tar xzvf tengine-2.1.2.tar.gz
RUN cd tengine-2.1.2 && ./configure --add-module=/home/lua-nginx-module-0.9.16rc1/ --add-module=/home/ngx_devel_kit-0.2.19 && make && make install

# add tengine user
RUN adduser --disabled-login --gecos 'Tengine' nginx

# port
EXPOSE 80
EXPOSE 443

# clear aptlist
RUN rm -rf /var/lib/apt/lists/*

# RUN TENGINE
ADD run.sh /home/run.sh
RUN chmod 755 *.sh

CMD ["run.sh"]

