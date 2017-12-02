#! /bin/sh

cd
git clone https://github.com/zhumengu/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
