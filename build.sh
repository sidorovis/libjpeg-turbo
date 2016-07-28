#!/bin/sh

set -e
set -x

SDKVER="9.3"
export IPHONEOS_DEPLOYMENT_TARGET="8.0"
CONFIG_OPTS="--with-jpeg8"

XCODE_PATH=`xcode-select -p`
export CC="${XCODE_PATH}/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"

export CFLAGS="-arch armv7 -pipe -Os -gdwarf-2 -isysroot ${XCODE_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS${SDKVER}.sdk"
export LDFLAGS="-arch armv7 -isysroot ${XCODE_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS${SDKVER}.sdk"

HOST="armv7-apple-darwin"
./configure ${CONFIG_OPTS} --host=${HOST}
