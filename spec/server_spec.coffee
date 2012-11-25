request = require 'request'
server = require '../server.js'

describe "Server", ->
  beforeEach ->
    # Use port 3001 so the tests can run while coding
    server.start port: 3001

  afterEach ->
    server.stop()

  it "responds successfully", (done) ->
    request "http://localhost:3001", (error, response, body) ->
      expect(response.statusCode).toEqual 200
      done()

  it "has the correct body", (done) ->
    request "http://localhost:3001", (error, response, body) ->
      expect(body).toContain "Welcome to Protoo"
      done()