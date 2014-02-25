# What is protoo

A new Personal Publishing Platform that paves a beautiful way for you to publish common types of media without being in the way.  It has a maximum amount of flexibility in the creation, combination and display of content. Protoo gets rid of a complicated backend to add and edit content. It also allows you to reorganise the way you display your content on the fly growing together with your desires and current interests.

To achieve these goals protoo uses state of the art [html5](http://www.html5rocks.com) and [css3](http://www.w3schools.com/css3) technology and [nodejs](http://nodejs.org) asynchronous programming with the shemeless database [mongoDB](http://www.mongodb.org).


## Modules / Quarks

To allow for a maximum flexibility protoo uses a module system - so called quarks - to add unlimited amount of functionality. Quarks live in viewable on the fly created containers called protons. There will be an easy to understand module api to add individual functionality.


## Tagging

Protoo relies solely on tagging to organize the content which gives unlimited power to organize and display it in different ways without having to rely on prebuild structures. There are two kinds of tags - a content type tag mostly automatically inhereted from the type of quarks used and semantic content tags that is user generated (so we are looking into way to also automate that to a degree).

## Rip Mix Remix

Protoo is also exposing all data so that different instances of protoo (and other apps) can easily reuse the content. All shared content has metadata embedded that also includes the original author and the license used to publish the content. Reused content gets a backlink so everybody knows where content is being used.


## Wiki

For the moment the official Wiki and further documentation can be found at the development wiki: https://intern.prototypen.com/wiki/projects/protoo1/protoo.html - if you want to contribute to the creation or maintainance of protoo please ask for an account on the wiki to get write priviliges (protoo (at) prototypen (dot) com)


## Does it build?

Build Status from [travis-ci.org](https://travis-ci.org): [![Build Status](https://secure.travis-ci.org/prototypen/protoo.png?branch=master)](https://secure.travis-ci.org/prototypen/protoo)


## Deployment

Once basic functionality is working there will be a demonstration deployment of protoo on [protoo.org](https://protoo.org)

## ToDos

We are currently at the beginning. There are lots of todos:

1. ~~basic user authentication with user models and connection with the database~~
2. backbone, chaplin, require, jquery integration
3. a proton with tags
4. a basic text module


## Brought to you by
[fALk Gärtner aka protofALk](https://github.com/protofalk) [Udo Kramer aka optikfluffel](http://udokramer.com/) and hopefully [others](https://github.com/prototypen/protoo/graphs/contributors)


[![Stories in Ready](https://badge.waffle.io/prototypen/protoo.png?label=ready)](http://waffle.io/prototypen/protoo)
