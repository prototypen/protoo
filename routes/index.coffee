i18n = require 'i18next'

i18n.init lng: "en-US", ns: "interfaces", resGetPath: 'locales/en-US/interfaces.json', debug: true
console.log  i18n.lng
console.log "test" + i18n.t 'interfaces:app.name'


# GET home page.
indexPageTitle = "protoo"

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