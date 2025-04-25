# Friction SDK

Friction SDK used to build and maintain binaries for supported platforms.

## Linux

Use `build_linux.sh`.

### Requirements

* Docker

### Options

* `BUILD_ENGINE` = `OFF`/`ON` *(default is `ON`)*
  * Build skia engine or use prebuilt
* `REL` = `1`/`0` *(default is `0`)*
  * Only use for official releases
* `BRANCH` = `<branch>` *(default is `main`)*
* `COMMIT` = `<commit>` *(default is none)*
* `TAG` = `<tag>` *(default is none)*
* `CUSTOM` = `<custom/addition version string>` *(default is none)*
* `MKJOBS` = `<threads>` *(default is `4`, only used when building SDK)*
* `ONLY_SDK` = `1`/`0` *(default is `0`)*
  * Just build the SDK
* `LOCAL_BUILD` = `0`/`1` *(default is `1`)*
  * Run local built docker container
* `DOWNLOAD_SDK` = `1`/`0` *(default is `0`)*
  * Use a prebuilt SDK
