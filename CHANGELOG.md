# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.2] - 2019-04-16
###[Fixed]
- Remove useless dependency to pry and bundler
- Fix require rspec for rakefile
- Fix spec deprecated Faker

## [1.0.2] - 2018-03-27
###[Fixed]
- Update gems (security fix)
- Send action to evostream instance global if uri_in is not precised

## [1.0.1] - 2017-12-21
###[Fixed]
- Update gem (nokogiri and yard)

## [1.0.0] - 2017-09-18
### [Added]
- Add mandatory element for each command
- Add usage to CLI

### [Fixed]
- Fix spec with mandatory parameter


## [0.3.2] - 2017-08-10
### [Added]
- Add log information when command is sending to evostream
- Add pushSettings key for ouStreamCreated event
- Add method for listing all command in this gem

### [Fixed]
- Fix model to configuration generator

## [0.3.1] - 2017-08-09
### [Added]
- Basic information for configuration to this gem
- Add log information
- Test string argument to command sending it's correct
- Complete test for command classes
- Add command setLogLevel

## [0.2.0] - 2017-05-26
### [Fixed]
- Change concat string for encode64

### [Added]
- Add command getStreamInfo

## [0.3.0] - 2017-05-16
### [Added]
- Add command listConfig
- Add command listStreams

### [Fixed]
- Change method encode base 64, use strict instead of urlsafe
- Use Hash response with symbol
- Refractoring response
- ~~Fix json response~~

## [0.2.6] - 2017-04-24
### [Fixed]
- Refractoring send_command

### [Added]
- Add spec test
- Add response obect for send_command

## [0.2.5] - 2017-04-11
### [Added]
- Method for listing all events compatible with gem

### [Fixed]
- Response body is empty return 204

## [0.2.4] - 2017-04-05
### [Fixed]
- Format response

## [0.2.3] - 2017-04-04
### [Added]
- Command push_stream

### [Fixed]
- Model use acronym for DASH and HLS

## [0.1.2] - 2017-03-14
### [Fixed]
- Save configuration evostream in model

## [0.1.1] - 2017-03-13
### [Fixed]
- Path gem
- Spec execution with rake
- Cleanning initializer

### [Added]
- Spec for requests event

## [0.1.0] - 2017-03-10
### [Added]
- Create event InStreamCreated InStreamClosed and OutStreamCreated
- Send event with command automaticaly
- Configure DSL service
