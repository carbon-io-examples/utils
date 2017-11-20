# Utils

A set of utility script for managing the examples.

## Prerequisites

- [jq](https://stedolan.github.io/jq/): `brew install jq`
- [package-merge](https://www.npmjs.com/package/package-merge): `npm i -g package-merge`
- [spread](https://github.com/tfogo/spread): `brew install tfogo/tools/spread`

## Download all examples

```
curl https://api.github.com/orgs/carbon-io-examples/repos\?per_page\=200 | jq -r '.[].ssh_url' | xargs -L 1 git clone
```

## Install Node modules

This will merge together all the examples' `package.json`s and install the modules in the parent folder. That way you only need to install the modules for each example once.

```
ls */package.json | xargs package-merge > package.json
npm i
```

Optionally, link any modules for testing, e.g. `npm link @carbon-io/carbond`.

## Run tests

```
spread 'npm test'
```

## Run commands based on test results

Spread will run commands in sequence on each subdirectory. If any command in the sequence fails, the rest of the commands will not run. Therefore, you can run commands based on the exit code of tests:

```
spread 'npm test' 'git checkout -b new-branch && git push origin new-branch'
```

## Useful commands

Most bulk updates are to the READMEs.

```
sed -i "" -e "s/io-0\.7/io-0.8/g" README.md
```
