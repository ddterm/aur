#!/bin/bash

set -ex

pacman -S --needed --noconfirm python-tox python-gobject wl-clipboard xorg-server-xvfb

pytest_args=(
  -p no:cacheprovider
  --system-bus
  --self-contained-html
  -n auto
  -vv
)

exec sudo -E -u builduser tox -c "$(find . -name tox.ini)" --sitepackages -e pytest -- "${pytest_args[@]}"
