#!/usr/bin/env bash

chr=$HOME/jail
# creating our structure
mkdir -p $chr/{bin,lib,lib64}

# select the desired bins
which bash
which ls
cp -v /usr/bin/bash $chr/bin
cp -v /usr/bin/ls $chr/bin

# check and copy dependecies for each bin in the chroot enc
ldd /bin/{bash,ls}

cp --parents {....}  $HOME/jail

# activate environment
sudo chroot $HOME/jail /bin/bash