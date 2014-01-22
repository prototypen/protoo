# requirements
home = require './controllers/home'

# Routes
module.exports = (app) ->
  app.get '/', home.index
