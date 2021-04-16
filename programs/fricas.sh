#!/usr/bin/bash

sudo apt update
sudo apt install -y sbcl
git clone https://github.com/fricas/fricas.git
cd fricas/
./configure
make -j$(nproc)
make install
