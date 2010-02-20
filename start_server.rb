#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), %w[lib server])) 

WebServer.new(8080, 'pages').start