#!/usr/bin/env ruby

require "yaml"
require "cgi"

class Wiki
  def initialize()
    DefaultPage.new
  end
end

class Page
  attr_accessor :title, :content

  def initialize
     cgi = CGI.new("html4")
      cgi.out {
        cgi.html {
          cgi.head {cgi.title {self.title}
          } +
        cgi.body { self.content }
      }
  }
  end
end

class DefaultPage < Page
  
  
  def content
  "<h1>Please create a first page</h1>
   <p><a href='new'>Create a New Page</a></p>"
  end

  def title
    'No pages in the wiki - Why not create one?'
  end
end

class PageNotFound < Page
  def content
  "<h1>This page doesn't exist...</h1>
   <p><a href='new'>why not create it</a></p>"
  end

  def title
    "Page Not Found - Why not create it?" 
  end
end

w = Wiki.new
