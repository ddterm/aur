#!/bin/bash

set -ex

testdir="$(find . -name pytest.ini -printf '%h' -quit)"

exec sudo -u builduser pytest -p no:cacheprovider --system-bus "$testdir"
