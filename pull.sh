#!/usr/bin/env bash

set -ex

for pkg in gnome-shell-extension-ddterm gnome-shell-extension-ddterm-git
do
  git subtree pull --prefix=$pkg https://aur.archlinux.org/$pkg.git master
done
