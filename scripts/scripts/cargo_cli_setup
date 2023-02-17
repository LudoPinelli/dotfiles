#!/usr/bin/env bash

cargo new "$1"
cd "$1"
gibo dump Rust > .gitignore
cargo add -D assert_cmd
cargo add -D predicates
mkdir -p tests/expected
touch tests/cli.rs
cargo build
