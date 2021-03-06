#!/usr/bin/env ruby

require 'webrick'
Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

class WebServer
  
  PAGES = 'pages'
  
  include WEBrick
  def initialize(port_number, pages_directory, controller=PageController)
    print "\n-=[ STARTING WEBrick SERVER ]=-\n"
    @server = WEBrick::HTTPServer.new(:Port => port_number)
    @server.mount('/', WikiServlet, pages_directory, controller)
    trap("INT") { @server.stop }
  end
 
  def start
    @server.start
  end
 
  def stop
    @server.shutdown
  end
end

class WikiServlet < WEBrick::HTTPServlet::AbstractServlet
  
  def initialize(server, pages_directory, controller)
    super(server)
    
    @controller = controller
  end
  
  def do_GET(request, response)
    status, content_type, body,redirect_status, redirect = process_request(request)
    
    response.status = status
    response['Content-Type'] = content_type
    response.body = body
    response.set_redirect(redirect_status, redirect) if redirect
  end
  
  def do_POST(request, response)
    status, content_type, body, redirect_status, redirect = @controller.new.create(request)
    response.status = status
    response['Content-Type'] = content_type
    response.body = body
    response.set_redirect(redirect_status, redirect) if redirect
  end
  
  def process_request(request)
    Router.new(request, @controller.new).setup_response
  end
end

