mongoose  = require 'mongoose'
User = require '../../models/user'

describe 'User', ->
  beforeEach ->
    # Connect to the test database before each test
    mongoose.connect('mongodb://localhost/protoo-test')

    # Generate fake user
    @user = new User
      username: 'testuser'
      password: 'testpassword'

  afterEach ->
    # Disconnect from the test database after each test
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
