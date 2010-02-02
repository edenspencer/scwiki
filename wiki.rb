#!/usr/bin/env ruby

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

class Wiki  
  def initialize
    script, @action, @page = ENV['PATH_INFO'].split('/')
    self.send(@action)
  end
  
  def show
    puts "Content-Type: text/html"
    puts
    puts "<html>"
    puts "<body>"
    puts "<h1>#{@page}</h1>"
    puts "</body>"
    puts "</html>"
  end
end

Wiki.new
