# GET home page.
protooName = "Protoo"

exports.index = (req, res) ->
  res.render "index",
    protooName: protooName

# GET firstrun page.
exports.firstrun = (req, res) ->
  res.render "firstrun",
    protooName: protooName


# GET login page.
exports.login = (req, res) ->
  res.render "login",
    protooName: protooName

# GET videoplayertest page.
exports.videoplayer = (req, res) ->
  res.render "videoplayer",
    protooName: protooName
