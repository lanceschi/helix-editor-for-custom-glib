# Description

This repository contains some script files for building the [helix][helix-github] editor from source within a docker image. The scripts can be tweaked in order to target specific GLIB library versions. By default `ubuntu:20.04` is the docker base image featuring GLIBC version 2.31.

# Build under linux

Follow these simple steps:

1. clone locally this repository;
2. CD into the cloned repository folder;
3. run `./build.sh` from a shell prompt and wait.

The `build.sh` script:

1. will build the docker image;
2. run the built image as a docker container;
3. extract the built files into a local host folder.

When the build step is over, you'll find all the required files (binary, grammars, etc ...) in a subfolder labelled `helix-23.03`. Folder name follow the pattern `helix-<VERSION>` and can be modified at line 5 of `build.sh` file.

## Configure the helix target version

Modify the `VERSION` variable at line 3 of the `build.sh` shell script file.

## Configure the OS docker base image

Modify the ubuntu default base image at line 1 of the `Dockerfile`.


[helix-github]: https://github.com/helix-editor/helix