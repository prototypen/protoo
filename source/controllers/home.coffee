# Handles the home-page rendering
# url: /
module.exports =

  index: (req, res) -> res.render 'home', username: req.user.username
