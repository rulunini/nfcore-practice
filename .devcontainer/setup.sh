#!/usr/bin/env bash

# Customise the terminal command prompt
printf "export PS1='\\[\\e[3;36m\\]\${PWD#/workspaces/} ->\\[\\e[0m\\] '\n" >> $HOME/.bashrc
export PS1='\[\e[3;36m\]${PWD#/workspaces/} ->\[\e[0m\] '

# Install vim
apt-get update && apt-get install -y vim

# Install Nextflow
curl -s https://get.nextflow.io | bash
mv nextflow /usr/local/bin/
chmod +x /usr/local/bin/nextflow

# Install Java (required for Nextflow)
apt-get install -y openjdk-11-jdk

cat /usr/local/etc/vscode-dev-containers/first-run-notice.txt
