#!/bin/bash

mount --bind /home/netlogon/clients-linux/unefois /root/batts/github/clients-linux/unefois/
mount --bind /home/netlogon/clients-linux/bin /root/batts/github/clients-linux/bin/

# voir https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
ssh-add /root/.ssh/battsatac@github_rsa
