#!/usr/bin/env ruby

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

class Wiki  
  def initialize
    script, @action, @page = ENV['PATH_INFO'].split('/')
    #@f = File.expand_path(File.join(File.dirname(__FILE__), 'pages', @page))
    self.send(@action, @page)
  end
  
  def show(page)
    puts "Content-Type: text/html"
    puts
    puts "<html>"
    puts "<body>"
    #puts "#{@f.inspect}"
    puts "<h1>#{page}</h1>"
    puts "</body>"
    puts "</html>"
  end
  
  def edit(page)
    puts "Content-Type: text/html"
    puts
    puts "<html>"
    puts "<body>"
    puts "<h2>Editing</h2>"
    puts "<h1>#{page}</h1>"
    puts "</body>"
    puts "</html>"
  end
end

Wiki.new
