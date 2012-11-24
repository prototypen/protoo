i18n = require 'i18n'


# GET home page.
indexPageTitle = "Protoo"
firstrunPageTitle = "proto init"
firstRunInlineTite = "one small step for you one big step for your protoo"
loginPageTitle = "login"
loginlineTite = "Welcome Back Friend!"
	

exports.index = (req, res) ->
  res.render "index",
    title: indexPageTitle

# GET firstrun page.
exports.firstrun = (req, res) ->
  res.render "firstrun",
    title: firstRunPageTitle,
    innerTitle: firstRunInlineTite
    
    
# GET login page.
exports.login = (req, res) ->
  res.render "login",
    title: loginPageTitle,
    innerTitle: loginlineTite