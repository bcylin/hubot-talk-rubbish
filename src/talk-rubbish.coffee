# Description:
#   Hubot talking rubbish.
#
# Dependencies:
#   "hubot-redis-brain": "0.0.2"
#
# Configuration:
#   HUBOT_RUBBISH_TRIGGERS - Array of commands that hubot responds to
#   HUBOT_RUBBISH_PHRASES_URL - A url to a JSON of phrases array
#
# Commands:
#   afk - "Bye!"
#   hubot talk rubbish - Talk rubbish
#   hubot reset rubbish - Remove cached rubbish list
#
# Author:
#   bcylin

Array.prototype.diff = (arr) ->
  this.filter (item) ->
    arr.indexOf(item) < 0

module.exports = (robot) ->
  robot.hear /afk/i, (msg) ->
    msg.send "Bye!"

  robot.respond /reset rubbish/i, (msg) ->
    robot.brain.remove "hubot_rubbish_phrases"
    robot.brain.remove "hubot_phrases_said"
    msg.send "I have dumped rubbish!"

  triggers = ["talk rubbish"]
  try
    more = JSON.parse process.env.HUBOT_RUBBISH_TRIGGERS
    triggers = triggers.concat more if more.length > 0
  regex = new RegExp triggers.join("|"), "i"

  randomPhrase = () ->
      list = robot.brain.get("hubot_rubbish_phrases")
      said = robot.brain.get("hubot_phrases_said") or []

      if not list?
        return null
      else if said.length >= list.length
        said = [] # reset said items

      phrase = msg.random(list.diff(said))
      if phrase?
        said.push phrase
        robot.brain.set "hubot_phrases_said", said
      phrase

  robot.respond regex, (msg) ->  
    rubbish = randomPhrase()
    msg.send rubbish if rubbish?
    saidAnythingYet = rubbish?

    # update phrases
    url = process.env.HUBOT_RUBBISH_PHRASES_URL
    if not url?
      msg.send "Rubbish bin's empty... []"
      return

    robot.http(url)
      .get() (err, res, body) ->
        try
          newList = JSON.parse body
          robot.brain.set "hubot_rubbish_phrases", newList
        catch e
          console.log "#{e.message} from #{url}"
          msg.send "Error updating phrases from #{url}"

        if not saidAnythingYet
          msg.send randomPhrase() ? "I don't talk rubbish."
