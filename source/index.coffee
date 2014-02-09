## Basic application initialization

# include requirements
express = require 'express'
dust = require 'dustjs-linkedin'
consolidate = require 'consolidate'
redisStore = require('connect-redis')(express)
passport = require 'passport'
stylus = require 'stylus'

# Create app instance
app = express()

# Set port
app.port = process.env.PORT or 3000

## Setup Express Middleware to use
# More info at: http://expressjs.com/api.html#middleware

# Use stylus middleware for now
app.use stylus.middleware(
  src: "#{process.cwd()}/assets"
  dest: "#{process.cwd()}/public"
)

# Serve files in public as statics
app.use express.static "#{process.cwd()}/public"

# Set default title
app.locals.title = 'Protoo'

# Formerly body parser
app.use express.json()
app.use express.urlencoded()

# Cookie parser
app.use express.cookieParser()

# Set up redis as session store
app.use express.session(
  store: new redisStore(
    host: process.env.REDIS_HOST or 'localhost'
    port: process.env.REDIS_PORT or 6379
    db: process.env.REDIS_DB or 0
  )
  cookie:
    maxAge: 14 * 24 * 60 * 60 * 1000 # 14 days in ms
  secret: process.env.SESSION_SECRET or 'mySuperUnguessableSecret'
)

# Set up passport
app.use passport.initialize()
app.use passport.session()

# Set the view engine
app.engine 'dust', consolidate.dust
app.set 'view engine', 'dust'

# Include routes
routes = require './routes'
routes(app)

# Error handling
app.use (error, req, res, next) ->
  console.error error.stack
  res.send 500, 'Oh no! Something broke!'

# 404 handling
app.use (req, res, next) ->
  console.error "Error 404 for: #{req.originalUrl}"
  res.send 404, 'Sorry, could not find that!'

# Export application object
module.exports = app
