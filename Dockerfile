FROM ubuntu:20.04 AS builder

ARG VERSION='23.03'

# Installing build essential tools
RUN apt update && apt install -y git curl build-essential

# Installing Rust, Cargo etc ...
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Cloning into Helix repository
RUN git clone https://github.com/helix-editor/helix && \
  cd helix && git checkout $VERSION

# Build Helix binary
RUN cd /helix && /root/.cargo/bin/cargo install --path helix-term --locked

# Delete grammar sources
RUN rm -rf /helix/runtime/grammars/sources