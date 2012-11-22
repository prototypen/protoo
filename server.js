/****************************** Dependencies */
require('coffee-script');

var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path')
  , stylus = require('stylus')
  , async = require('async')
  , mongoose = require('mongoose');

var app = express();

/****************************** Database */
mongoose.connect('mongodb://localhost/protoo');

/****************************** App configuration */
app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  if (app.settings.env == 'development') {
    app.use(express.logger('dev'));
  }
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser('There are no secrets its all lies'));
  app.use(express.session());
  app.use(app.router);
  app.use(stylus.middleware({
    src: __dirname + '/public',
    compile: function(str, path){
      return stylus(str)
        .set('filename', path)
        .set('compress', true);
    }
  }));
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

/****************************** Routes */
app.get('/yyy', routes.index);
app.get('/xxx', routes.firstrun);


/****************************** Start Server */
exports.start = function( config, readyCallback ) {
  this.server = app.listen( config.port, function() {
    if (app.settings.env != 'test') {
      console.log('Server running on port %d in %s mode', config.port, app.settings.env);
    }
  });
};

/****************************** Stop Server */
exports.stop = function() {
  mongoose.disconnect();
  this.server.close();
};