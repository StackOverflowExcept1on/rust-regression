#!/usr/bin/env bash
die() { echo "$*" 1>&2 ; exit 1; }
(pwd | grep $USER) || die "plz compile in /home/$USER/..."
cargo build --release --target wasm32-unknown-unknown
LC_ALL=C.UTF-8 grep $USER ./target/wasm32-unknown-unknown/release/wasm_program.wasm \
    && die "/home/$USER/... found in WASM :(" || true
