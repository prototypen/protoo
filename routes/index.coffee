# GET home page.
protooName = "Protoo"

indexPageTitle = "index.pageTitle"

firstrunPageTitle = "firstRun.pageTitle" #"proto init"
firstRunInlineTite = "firstRun.inlineTitle" #"one small step for you one big step for your protoo"
loginPageTitle = "login.pageTitle" #"login"
loginlineTite = "login.inlineTitle" #"Welcome Back Friend!"
	

exports.index = (req, res) ->
  res.render "index",
    title: protooName,
    protooName: protooName

# GET firstrun page.
exports.firstrun = (req, res) ->
  res.render "firstrun",
    protooName: protooName

    
# GET login page.
exports.login = (req, res) ->
  res.render "login",
    protooName: protooName
