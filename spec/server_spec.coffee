request = require 'request'

describe "Server", ->
  it "responds successfully", (done) ->
    request "http://localhost:3000", (error, response, body) ->
      expect(response.statusCode).toEqual 200
      done()

  it "has the correct body", (done) ->
    request "http://localhost:3000", (error, response, body) ->
      expect(body).toContain "Welcome to protoo"
      done()