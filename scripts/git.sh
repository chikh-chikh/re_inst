#!/bin/sh

git config --global gpg.format ssh
git config --global user.signingkey /home/ru/.ssh/*.pub

#git config --global commit.gpgsign true



git remote set-url origin git@github.com:ru927/reinst
git remote -v

ssh -t -ai ~/.ssh/id_ed*

