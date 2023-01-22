FROM node:18-bullseye

# Arguments
ARG USER=captcha-solver
ARG USER_HOME=/home/$USER
ARG VOLUME=/home/volume
ARG SHELL=/bin/bash

RUN apt-get update

# Install OS utilities
RUN apt-get install -y locales \
    && sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen
RUN apt-get install -y sudo
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

# Install Dev utilities
RUN pip3 install yapf
RUN pip3 install jupyter

# Install CLI utilities
RUN apt-get install -y jq
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && apt-get install -y less

# Set up non root user
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -ms $SHELL $USER
RUN mkdir -p $VOLUME \
    && chown -R $USER:$USER $VOLUME

# Install Serverless framework + plugins
RUN npm install -g serverless --unsafe
RUN npm install -g serverless-deployment-bucket
RUN npm install -g @serverless/safeguards-plugin

# Preserve bash history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> "/root/.bashrc" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USER /commandhistory \
    && echo $SNIPPET >> "$USER_HOME/.bashrc"

USER $USER
