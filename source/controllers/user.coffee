passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
User = require '../models/user'

# Use passport-local-mongoose authentication handler
passport.use new LocalStrategy(User.authenticate())

# Use static serialize and deserialize of model for passport session support
passport.serializeUser User.serializeUser()
passport.deserializeUser User.deserializeUser()

module.exports =
  login: (req, res) ->
    # Redirect to home page if authenticated already
    return res.redirect '/' if req.isAuthenticated()

    res.render 'user/login'

  authenticate: passport.authenticate('local',
                  successRedirect: '/'
                  failureRedirect: '/login'
                )

  signup: (req, res) ->
    # Log out if authenticated already
    return res.redirect '/logout' if req.user?

    res.render 'user/signup'

  create: (req, res) ->
    {username, password} = req.body

    newUser = new User(username: username)

    User.register newUser, password, (error, account) ->
      # Redirect to '/' if everything is fine
      return res.redirect '/' unless error?

      # Error handling
      res.render('user/signup', account: account)

  logout: (req, res) ->
    req.session.destroy()
    res.redirect '/'
