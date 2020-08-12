FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass

# Install Nodejs
RUN apt-get install -y git curl vim sudo apt-utils
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
apt-get update && \
apt-get install -yq google-chrome-stable && \
apt-get --only-upgrade install -yq google-chrome-stable

# Install FireFox
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F && \
apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu bionic main" && \
apt-get update && \
apt-get install -yq firefox && \
apt-get --only-upgrade install -yq firefox

# Delete Work Dir
RUN rm -rf /var/lib/apt/lists/*

USER jenkins
