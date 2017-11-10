#!/bin/bash

curl https://api.github.com/orgs/carbon-io-examples/repos\?per_page\=200 | jq -r '.[].ssh_url' | xargs -L 1 git clone
ls */package.json | xargs package-merge > package.json
npm i && npm link @carbon-io/carbond
