#!/bin/sh

wsmc="./isleap.wasm"

isleapc() {
	node isleap.mjs
}

isleapp() {
	seq 1 9999 |
		python3 -c 'import calendar; import sys; import functools; import json; functools.reduce(
      lambda state, f: f(state),
      [
        functools.partial(map, int),
        functools.partial(
          map,
          lambda year: (year, calendar.isleap(year)),
        ),
        functools.partial(map, json.dumps),
        functools.partial(map, print),
        lambda prints: sum(1 for _ in prints),
      ],
      sys.stdin,
    )' |
		jq \
			--compact-output \
			--raw-output \
			'. | @csv' |
		sed \
			-n \
			-e 's/true/1/' \
			-e 's/false/0/' \
			-e 's/,/:/' \
			-e p
}

isleapc | md5
isleapp | md5
