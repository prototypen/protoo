#get the markdown converter and the filestream
marked = require 'marked'
fs = require 'fs'

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

# GET about page.
exports.about = (req, res) ->
	# read the README file and pass it onto the jade template
	fs.readFile __dirname + '/../README.markdown', 'utf-8', (err, data) -> 
		if err 
			throw err
		res.render "about",
			protooName: protooName
			aboutOut: marked(String(data))

# GET videoplayertest page.
exports.videoplayer = (req, res) ->
	res.render "videoplayer",
		protooName: protooName
