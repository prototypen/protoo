mongoose = require('mongoose')

# bcrypt for secure password hashing
bcrypt = require('bcrypt')
SALT_WORK_FACTOR = 10

UserSchema = new mongoose.Schema(
  # username to identify
  username:
    type: String
    required: true
    unique: true

  # hashed password
  password:
    type: String
    required: true

  # simple flag if the user is active
  isActive:
    type: Boolean
    default: true

  # TODO: Add some roles
  # role:
  #   type: String
  #   enum: ['Administrator', 'Blogger', 'Commenter']
  #   default: 'Blogger'
)

# Hash the password before persisting the user in the database
UserSchema.pre "save", (next) ->
  user = this

  # only hash the password if it has been modified or is new
  return next() unless user.isModified("password")

  # generate salt
  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    return next(err) if err

    # hash the password along with the salt
    bcrypt.hash user.password, salt, (err, hash) ->
      return next(err) if err

      # override the cleartext password with the hashed one
      user.password = hash
      next()

# Use bcrypt to compare the hashed password
UserSchema.methods.comparePassword = (candidatePassword, callback) ->
  bcrypt.compare candidatePassword, @password, (err, isMatch) ->
    return callback(err) if err
    callback null, isMatch

# Exports `User` Mongoose model as module.
module.exports = mongoose.model('User', UserSchema)
