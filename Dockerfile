FROM node:carbon

USER root

RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

USER root

RUN apt-get update; RUN apt-get -y upgrade; apt-get clean
RUN apt-get install -y build-essential cmake pkg-config  wget


RUN echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list
RUN wget -qO - https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key | apt-key add -
RUN apt-get install -y libzmq-dev

RUN mkdir -p /home/apps/project_data && chown apps:apps /home/apps/project_data

WORKDIR /home/apps/project_data


CMD "./run.sh"


