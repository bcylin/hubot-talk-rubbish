chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "talk-rubbish", ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require("../src/talk-rubbish")(@robot)

  it "should register a hear listener to afk", ->
    expect(@robot.hear).to.have.been.calledWith(/afk/i)
  
  it "should register a respond listener to reset rubbish", ->
    expect(@robot.respond).to.have.been.calledWith(/reset rubbish/i)

  it "should register a respond listener to talk rubbish", ->
    expect(@robot.respond).to.have.been.calledWith(/talk rubbish/i)
