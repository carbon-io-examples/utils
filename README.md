# Utils

A set of utility script for managing the examples.

## Prerequisites

- [jq](https://stedolan.github.io/jq/): `brew install jq`
- [package-json-merge](https://www.npmjs.com/package/package-json-merge): `npm i -g package-json-merge`
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

You can run in specific directories by passing them as arguments after the command to spread:

```
spread 'npm test' example*
```

## Run commands based on test results with spread

For example, committing and pushing if tests are passed:

```
spread 'npm test && git checkout -b new-branch && git push origin new-branch'
```

## Useful commands

Most bulk updates are to the READMEs.

```
sed -i "" -e "s/io-0\.7/io-0.8/g" README.md
```
