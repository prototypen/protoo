/****************************** Dependencies */
require('coffee-script');

var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path')
  , stylus = require('stylus')
  , async = require('async')
  , mongoose = require('mongoose')
  , everyauth = require('everyauth');

var app = express();

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
  app.use(express.cookieParser('YOUR SECRET HERE'));
  app.use(express.session());
  app.use(everyauth.middleware());
  app.use(stylus.middleware({
    src: __dirname + '/public',
    compile: function(str, path) {
      return stylus(str)
        .set('filename', path)
        .set('compress', true);
    }
  }));
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

/****************************** Routes */
app.get('/', routes.index);

/****************************** Start Server */
exports.start = function( config, readyCallback ) {
  this.server = app.listen( config.port, function() {

    /****************************** Connect to Database */
    if (app.settings.env == 'test') {
      mongoose.connect('mongodb://localhost/protoo_test');
    } else {
      mongoose.connect('mongodb://localhost/protoo');
    }

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