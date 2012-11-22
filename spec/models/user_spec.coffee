mongoose  = require 'mongoose'
User = require '../../models/user'

describe 'User', ->
  beforeEach ->
    mongoose.connect('mongodb://localhost/protoo-test')

    @user = new User
      username: 'testuser'
      password: 'testpassword'

  afterEach ->
    mongoose.disconnect()

  it 'should be saveable', ->
    @user.save (err, doc) ->
      expect(doc.username).toEqual('testuser')
      doc.remove (err, doc) ->
        jasmine.asyncSpecDone()
    jasmine.asyncSpecWait()

  it 'should be retrievable', ->
    @user.save (err, _doc) ->
      user = User.findOne {username: 'testuser'}, (err, doc) ->
        expect(doc.username).toEqual('testuser')
        doc.remove (err, doc) ->
          jasmine.asyncSpecDone()
    jasmine.asyncSpecWait()

