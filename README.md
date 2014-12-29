hubot-talk-rubbish
==================

A Hubot script package for fun

[![Build Status](https://travis-ci.org/bcylin/hubot-talk-rubbish.svg?branch=develop)](https://travis-ci.org/bcylin/hubot-talk-rubbish)

## Development

See [`src/talk-rubbish.coffee`](src/talk-rubbish.coffee) for full documentation.

### Run Hubot locally

```sh
npm install
HUBOT_RUBBISH_PHRASES_URL=$URL rake hubot
```

### Run tests

```sh
npm test
```

## Usage

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

Set up `HUBOT_RUBBISH_PHRASES_URL` that links to a JSON with phrases for hubot, using Heroku for example:

```sh
heroku config:add HUBOT_RUBBISH_PHRASES_URL="http://link.to/file.json"
```

Set up `HUBOT_RUBBISH_TRIGGERS` for additional triggers (optional):

```sh
heroku config:add HUBOT_RUBBISH_TRIGGERS='["yo", "\\.\\.\\.$"]'
```
