#!/bin/sh
set -e

# 先查询官方最新版本号，若与本地 ./version 一致则直接退出，避免每日重复下载
REMOTE_RAW=$(curl -fsS --max-time 15 "https://cz88.net/api/communityIpVersions/getLatestVersion?key=${CZDB_DOWNLOAD_TOKEN}" 2>/dev/null | sed -n 's/.*"data":"\([^"]*\)".*/\1/p' || true)
LOCAL_VERSION=$(tr -d '[:space:]' < version 2>/dev/null || true)
if [ -n "$REMOTE_RAW" ]; then
  # v20260617 -> 2026-06-17
  REMOTE_VERSION=$(echo "$REMOTE_RAW" | sed -E 's/^v?([0-9]{4})([0-9]{2})([0-9]{2})$/\1-\2-\3/')
  echo "remote=$REMOTE_VERSION local=$LOCAL_VERSION"
  if [ "$REMOTE_VERSION" = "$LOCAL_VERSION" ]; then
    echo "Remote version equals local, skip download"
    exit 0
  fi
else
  echo "Remote version API unavailable, fallback to full build"
fi

mkdir -p build/stand
mkdir -p build/raw
wget "https://www.cz88.net/api/communityIpAuthorization/communityIpDbFile?fn=czdb&key=${CZDB_DOWNLOAD_TOKEN}" -O build/czdb.zip
unzip build/czdb.zip -d build/

node src/packer_raw.js
ls -alh build/raw
VERSION=`cat version`
LATEST_VERSION=`node src/version.js`
if [ $VERSION != $LATEST_VERSION ]; then
  node src/packer.js
  ls -alh build/stand
  echo $LATEST_VERSION > version
  cat version
fi
