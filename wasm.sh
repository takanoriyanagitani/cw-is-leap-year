#!/bin/sh

src="./isleap.c"
dst="./isleap.wasm"

zig \
	cc \
	-target wasm32-freestanding \
	-msimd128 \
	-mrelaxed-simd \
	-nostdlib \
	-Oz \
	-Wl,--strip-all \
	-fno-sanitize=undefined \
	-Wl,--no-entry \
	-Wl,--export="isleap" \
	-o "${dst}" \
	"${src}"
