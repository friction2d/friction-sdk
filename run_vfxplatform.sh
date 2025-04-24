#!/bin/bash
#
# Friction - https://friction.graphics
#
# Copyright (c) Ole-André Rodlie and contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

set -e -x

CWD=`pwd`
BUILD_ENGINE=${BUILD_ENGINE:-"ON"}
REL=${REL:-0}
BRANCH=${BRANCH:-""}
COMMIT=${COMMIT:-""}
TAG=${TAG:-""}
CUSTOM=${CUSTOM:-""}
MKJOBS=${MKJOBS:-4}
ONLY_SDK=${ONLY_SDK:-0}
LOCAL_BUILD=${LOCAL_BUILD:-1}
DOWNLOAD_SDK=${DOWNLOAD_SDK:-0}
SDK_VERSION="1.0.0"
TAR_VERSION=${TAR_VERSION:-""}

DOCKER="docker run"
DOCKER="${DOCKER} -e BUILD_ENGINE=${BUILD_ENGINE} -e REL=${REL} -e MKJOBS=${MKJOBS} -e TAR_VERSION=${TAR_VERSION} -e SDK_VERSION=${SDK_VERSION} -e ONLY_SDK=${ONLY_SDK} -e DOWNLOAD_SDK=${DOWNLOAD_SDK} -e BRANCH=${BRANCH} -e COMMIT=${COMMIT} -e TAG=${TAG} -e CUSTOM=${CUSTOM}"
DOCKER="${DOCKER} -t --mount type=bind,source=${CWD}/distfiles,target=/mnt"

if [ ! -d "${CWD}/distfiles" ]; then
    mkdir -p ${CWD}/distfiles
fi
if [ ! -d "${CWD}/distfiles/builds" ]; then
    mkdir -p ${CWD}/distfiles/builds
fi
if [ ! -d "${CWD}/distfiles/sdk" ]; then
    mkdir -p ${CWD}/distfiles/sdk
fi

if [ "${LOCAL_BUILD}" = 1 ]; then
    (cd vfxplatform; docker build -t friction-vfxplatform -f Dockerfile.vfxplatform .)
    ${DOCKER} friction-vfxplatform
else
    docker pull frictiongraphics/friction-vfxplatform-sdk
    ${DOCKER} frictiongraphics/friction-vfxplatform-sdk
fi
