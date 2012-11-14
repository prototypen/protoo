# Setup for development

## Install requirements

*I assume you have [node.js](http://nodejs.org) with a least version 0.8.14 installed.*

Install all the needed dependencies locally using ```npm install```.

## Run the server

*Make sure you have mongoDB up and running. TODO: Automate soon.*

Start the server unsing ```npm start``` or ```node server```. Now you can visit [localhost:3000](http://localhost:3000).

## Run the tests

*Make sure you have mongoDB up and running. TODO: Automate soon.*

Use ```npm test``` to run [jasmine-node](https://github.com/mhevery/jasmine-node) with some predefined options once to see if everything is fine.

If you want to run the test automatically while you're coding you can use ```npm run-script autotest```.

*You could also use ```jasmine-node --help``` to see what you can do with it manually.*