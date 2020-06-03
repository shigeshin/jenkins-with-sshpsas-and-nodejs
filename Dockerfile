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
apt-get install -yq google-chrome-stable

# Install Japanese Font
RUN apt-get update -y \
&& apt-get install -y ttf-freefont

RUN mkdir /noto

ADD https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip /noto

WORKDIR /noto

RUN unzip NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/truetype/noto && \
    cp *.otf /usr/share/fonts/truetype/noto && \
    chmod 644 -R /usr/share/fonts/truetype/noto/ && \
    fc-cache -fv

WORKDIR /

# RUN rm -rf /noto

RUN rm -rf /var/lib/apt/lists/*

USER jenkins
