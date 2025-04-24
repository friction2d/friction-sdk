#!/bin/bash
set -e -x

cd $HOME
git clone https://github.com/friction2d/friction-sdk
cd friction-sdk/vfxplatform
BUILD_ENGINE=${BUILD_ENGINE} \
REL=${REL} \
MKJOBS=${MKJOBS} \
TAR_VERSION=${TAR_VERSION} \
SDK_VERSION=${SDK_VERSION} \
ONLY_SDK=${ONLY_SDK} \
DOWNLOAD_SDK=${DOWNLOAD_SDK} \
BRANCH=${BRANCH} \
COMMIT=${COMMIT} \
TAG=${TAG} \
CUSTOM=${CUSTOM} \
./build_vfxplatform.sh
