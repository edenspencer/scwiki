#!/usr/bin/env ruby

Dir[File.dirname(__FILE__) + 'lib/*.rb'].each {|file| require file }

class Wiki  
  def initialize
    script, @action, page = ENV['PATH_INFO'].split('/')
    #File.expand_path(File.join(File.dirname(__FILE__), 'pages', @page))
    @page = PageStore.read(page)
    #SUDO CODE.
    # if @page.class = 'PageNotFound'
    #   New
    # if @page.class = 'Page'
    #   Show or Edit?
       
    self.send(@action, @page)
  end
  
  def show(page)
    puts PageRenderer.render(page)
  end
  
  def new(page)
    
  end
  
  def edit(page)
    puts "Content-Type: text/html"
    puts
    puts "<html>"
    puts "<body>"
    puts "<h2>Editing</h2>"
    puts "<h1>#{page}</h1>"
    puts "< /body>"
    puts "</html>"
  end
end

Wiki.new
