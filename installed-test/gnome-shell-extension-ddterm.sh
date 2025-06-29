#!/bin/bash

set -ex

cd gnome-shell-extension-ddterm-61
curl https://github.com/ddterm/gnome-shell-extension-ddterm/commit/e8d8f6b0d79082ed5e601af1b7beb0917fa44b52.patch | patch -p1

source "$GITHUB_WORKSPACE/installed-test/gnome-shell-extension-ddterm-git.sh"
