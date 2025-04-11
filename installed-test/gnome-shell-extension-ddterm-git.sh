#!/bin/bash

set -ex

testdir="$(find . -name pytest.ini -printf '%h' -quit)"

exec sudo -E -u builduser pytest -p no:cacheprovider --system-bus "$testdir"
