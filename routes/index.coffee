# GET home page.
exports.index = (req, res) ->
  res.render "index",
    title: "protoo"

# GET firstrun page.
exports.firstrun = (req, res) ->
  res.render "firstrun",
    title: "protoo init",
    innerTitle: "one small step for you one big step for your protoo"