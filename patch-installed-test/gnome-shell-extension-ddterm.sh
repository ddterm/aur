#!/bin/bash

set -ex

cd gnome-shell-extension-ddterm-59
curl https://github.com/ddterm/gnome-shell-extension-ddterm/commit/6d61c65e89df2f04b525a27e8085146cb4021694.patch | patch -p1
