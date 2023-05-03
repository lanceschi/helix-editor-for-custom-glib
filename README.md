# Description

This repository will build helix binary targeting specific GLIB library.By default `ubuntu:20.04` is the docker base image.

# How to build the helix binary

Follow these simple steps:

1. Clone locally this repository;
2. CD into the cloned repo folder;
3. Run `./build.sh` from a shell prompt and wait.

When the build step is over, you'll find all the required files in a subfolder labelled `helix-23.03`

# Configure the helix target version

Modify the VERSION variable at line 3 of the `build.sh` shell script file.

# Configure the helix target version

Modify the ubuntu default base image at line 1 of the `Dockerfile`.