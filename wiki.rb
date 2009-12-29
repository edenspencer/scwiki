#!/usr/bin/env ruby

require "cgi"
require File.expand_path(File.join(File.dirname(__FILE__), %w[lib pages]))

class Wiki
  def initialize
    script, @action, @page = ENV['PATH_INFO'].split('/')
    self.send(@action)
  end
  
  def show
    cgi = CGI.new("html4")
    cgi.out {
        cgi.html {
          cgi.head {cgi.title {"Params Test"}
          } +
        cgi.body {  
          cgi.p { "Action = Show, Page = #{@page}" }
          }
      }
  }
  end

   def edit
    cgi = CGI.new("html4")
    cgi.out {
        cgi.html {
          cgi.head {cgi.title {"Params Test"}
          } +
        cgi.body {  
          cgi.p { "Action = Edit Page = #{@page}" }
          }
      }
  }
  end

end

Wiki.new
