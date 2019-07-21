FROM rust:1.36-slim

RUN mkdir /home/rustlings
WORKDIR /home/rustlings

COPY Cargo.lock Cargo.toml info.toml ./
COPY src src
COPY tests tests

RUN cargo install --force --path .

COPY exercises exercises
