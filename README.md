hubot-talk-rubbish
==================

A Hubot script package for fun

[![Build Status](https://travis-ci.org/bcylin/hubot-talk-rubbish.svg)](https://travis-ci.org/bcylin/hubot-talk-rubbish)

## Development

See `src/talk-rubbish.coffee` for full documentation.

### Run tests

```sh
npm test
```

## Installation

## Directory Structure

Using the common directory structure for hubot script packages it will be easy
to manage and allow others to easily contribute to your package.

### script

This directory is home to a couple of development scripts; `bootstrap` and `test`
they're used to bootstrap the development environment and run tests
respectively.

### src

This directory is home to the actual hubot scripts in the package. Your
`index.coffee` entry point will load the scripts from this directory.

### test

This directory is home to any tests you write for your scripts. This example
package uses Mocha, Chai and Sinon to manage writing tests.
