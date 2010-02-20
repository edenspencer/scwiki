#!/usr/bin/env ruby

Dir["test/*.rb"].each {|file| require file}

def teardown
  ["my_title", "savedtitle"].each do |f|
    File.delete((File.join(File.dirname(__FILE__), %w[.. pages], f))) if File.exists?((File.join(File.dirname(__FILE__), %w[.. pages], f)))
  end
end