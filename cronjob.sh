#!/usr/bin/env bash

GARDENLINUX_GENESIS="2020-03-31"
TODAY=$(date "+%Y-%m-%d")

START_SECONDS=$(date -d "$GARDENLINUX_GENESIS" +%s)
END_SECONDS=$(date -d "$TODAY" +%s)

GARDENLINUX_VERSION=$(( (END_SECONDS - START_SECONDS) / 86400 ))

cd package_aggregator
go run . -o ../packages/$GARDENLINUX_VERSION.json
popd

git add packages/$GARDENLINUX_VERSION.json
git commit -m "Package status for Gardenlinux Day $GARDENLINUX_VERSION"
git push -u origin main
