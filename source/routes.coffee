# requirements
home = require './controllers/home'
user = require './controllers/user'

# Routes
module.exports = (app) ->
  app.get '/', home.index

  app.get '/login', user.login
  app.post '/login', user.authenticate
  app.get '/signup', user.signup
  app.post '/signup', user.create
