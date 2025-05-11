#!/bin/bash

set -ex

pacman -S --needed --noconfirm python-tox python-gobject wl-clipboard xorg-server-xvfb

pytest_args=(
  -p no:cacheprovider
  --system-bus
  --self-contained-html
  -vv
)

toxdir="$(find "$PWD" -name tox.ini -printf '%h' -quit)"

echo "reports=${toxdir}/tests/report.html" >>"$GITHUB_OUTPUT"

exec sudo -E -u builduser tox -c "${toxdir}" --sitepackages -e pytest -- "${pytest_args[@]}"
