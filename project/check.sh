#!/usr/bin/env bash
die() { echo "$*" 1>&2 ; exit 1; }
(pwd | grep $USER) || die "plz compile in /home/$USER/..."
cargo build --release
LC_ALL=C.UTF-8 grep $USER ./target/release/libprogram.so && die "/home/$USER/... found in ELF :(" || true
