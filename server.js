#!/usr/bin/env node

require('coffee-script');

var app, port;

app = require('./source');

port = app.port;

app.listen(port, function() {
  return console.info(
    "[pid: %s] Listening on port %s\nPress CTRL-C to stop server.", process.pid, port
  );
});
