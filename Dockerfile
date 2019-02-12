FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass \
&& apt-get install -y git curl vim sudo apt-utils \
&& curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
&& apt-get install -y nodejs \
&& rm -rf /var/lib/apt/lists/*

USER jenkins