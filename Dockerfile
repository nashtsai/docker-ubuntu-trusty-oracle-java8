FROM ubuntu:trusty
MAINTAINER nashtsai (nash.tsai@gmail.com)

ENV TERM linux

# Prepare Java
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

# auto accept oracle jdk license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer unzip

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/
ENV PATH $PATH:$JAVA_HOME/bin
