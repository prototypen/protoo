mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'

# Connect to MongoDB
mongoose.connect process.env.MONGO_URL or 'mongodb://localhost/protoo'

# User Schema
userSchema = new mongoose.Schema
  createdAt:
    type: Date
    default: new Date

  updatedAt:
    type: Date

userSchema.pre 'save', (next) ->
  # handle updatedAt
  @updatedAt = new Date
  next()

# Add passport-local-mongoose plugin
# More info at: https://github.com/saintedlama/passport-local-mongoose
userSchema.plugin(passportLocalMongoose)

# Export mongoose model
module.exports = mongoose.model 'User', userSchema
