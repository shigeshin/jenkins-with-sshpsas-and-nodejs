FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass

RUN apt-get install -y git curl vim sudo apt-utils
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN rm -rf /var/lib/apt/lists/*

USER jenkins