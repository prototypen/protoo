/****************************** Dependencies */
require('coffee-script');

var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path')
  , stylus = require('stylus')
  , nib = require('nib')
  , async = require('async')
  , mongoose = require('mongoose')
  , everyauth = require('everyauth')
  , i18n = require('i18next');

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
  app.use(express.cookieParser('There are no secrets its all lies'));
  app.use(express.session());
  app.use(everyauth.middleware());
  app.use(stylus.middleware({
    src: __dirname + '/public',
    compile: function(str, path){
      return stylus(str)
        .set('filename', path)
        .set('compress', true)
        .use(nib())
        .import('nib')
    }
  }));
  app.use(i18n.handle);
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});


/*** i18n Language & Path Setups  **********/
var i18n_debug = app.settings.env === 'development' ? true : false;
i18n.init({ lng: "en-US", ns: "interfaces", resGetPath: 'locales/en-US/interfaces.json', debug: i18n_debug});
i18n.registerAppHelper(app);
i18n.addPostProcessor("jade", function(val, key, opts) {
   return require("jade").compile(val, opts)();
});

/****************************** Routes */
app.get('/', routes.index);
app.get('/firstrun', routes.firstrun);
app.get('/login', routes.login);
app.get('/videoplayer', routes.videoplayer);


/****************************** Start Server */
exports.start = function( config, readyCallback ) {
  this.server = app.listen( config.port, function() {

    /****************************** Connect to Database */
    if (app.settings.env == 'test') {
      mongoose.connect('mongodb://localhost/protoo-test');
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