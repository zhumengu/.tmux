#! /bin/sh

XSEL=$(which xel)
PKG=$(which apt-get)
if [ -z "$XSEL" ]; then
    [ -z "$PKG" ] && PKG=$(which yum)

    if [ $(id -u) -ne 0 ]; then
        sudo $PKG install -y xsel
    fi
    $PKG install -y xsel
fi

cd || exit 1
git clone https://github.com/zhumengu/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
