#!/bin/bash

sudo apt-get update;
sudo apt-get install -y python-software-properties software-properties-common;
sudo add-apt-repository -y ppa:pi-rho/dev;
sudo apt-get update;
sudo apt-get install -y tmux;
tmux -V
