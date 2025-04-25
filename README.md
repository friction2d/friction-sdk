# Friction SDK

Friction SDK used to build and maintain binaries for supported platforms.

## Linux

Run `build_linux.sh`.

### Requirements

* Docker

### Options

* `BUILD_ENGINE` = `OFF`/`ON` *(default is `OFF`)*
  * Build skia engine or use prebuilt
* `REL` = `0`/`1` *(default is `0`)*
  * Only use for official releases
* `BRANCH` = `<branch>` *(default is `main`)*
* `COMMIT` = `<commit>` *(default is none)*
* `TAG` = `<tag>` *(default is none)*
* `CUSTOM` = `<extra version string>` *(default is none)*
* `MKJOBS` = `<threads>` *(default is `4`, only used when building SDK)*
* `ONLY_SDK` = `0`/`1` *(default is `0`)*
  * Just build the SDK
* `LOCAL_BUILD` = `0`/`1` *(default is `1`)*
  * Run local built docker container
* `DOWNLOAD_SDK` = `0`/`1` *(default is `1`)*
  * Use a prebuilt SDK

## FFmpeg for Windows

FFmpeg for Windows is built using MXE on Linux or macOS using the MinGW toolchain (this is the only component that uses MinGW, the rest is MSVC).

### Requirements

* Linux/macOS
* https://mxe.cc/#requirements

### Build

```
git clone https://github.com/friction2d/mxe
cd mxe
../build_mxe_ffmpeg.sh
```
