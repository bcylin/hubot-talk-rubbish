hubot-talk-rubbish
==================

A Hubot script package for fun

[![Build Status](https://travis-ci.org/bcylin/hubot-talk-rubbish.svg)](https://travis-ci.org/bcylin/hubot-talk-rubbish)

## Development

See `src/talk-rubbish.coffee` for full documentation.

### Run Hubot locally

```sh
npm install
rake hubot
```

### Run tests

```sh
npm test
```

## Installation

Add the repository to your Hubot's `package.json`:

```json
dependencies: {
  "hubot-talk-rubbish": "git://github.com/bcylin/hubot-talk-rubbish.git#develop"
}
```

Include the package in your Hubot's `external-scripts.json`:

```json
[
  "hubot-talk-rubbish"
]
```
