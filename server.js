/****************************** Dependencies */
require('coffee-script');

var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path')
  , lessMiddleware = require('less-middleware');

var app = express();

/****************************** App configuration */
app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser('YOUR SECRET HERE'));
  app.use(express.session());
  app.use(app.router);
  app.use(lessMiddleware({
    src      : __dirname + "/public",
    compress : true
  }));
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

/****************************** Routes */
app.get('/', routes.index);

/****************************** Create Server */
http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
