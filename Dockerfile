FROM ubuntu:20.04 AS base

ARG VERSION='23.05'
ARG DEBIAN_FRONTEND='noninteractive'

# Installing build essential tools
RUN apt update && apt install -y curl build-essential software-properties-common

# Install the latest version of git (currently 2.40.1)
RUN add-apt-repository -y ppa:git-core/ppa && apt update && apt install -y git

# Installing Rust, Cargo etc ...
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Cloning into Helix repository
RUN git clone https://github.com/helix-editor/helix && \
    cd helix && git checkout $VERSION

ARG PATH="$PATH:/root/.cargo/bin"

WORKDIR /helix

# Build Helix binary
# RUN RUST_BACKTRACE=full cargo build --release
RUN cargo install --path helix-term --locked

# Delete grammar sources
RUN rm -rf /helix/runtime/grammars/sources