require 'webrick'

class WebServer
  include WEBrick

class HelloWorldServlet < HTTPServlet::AbstractServlet
  
  def do_GET(request, response)
    status, content_type, body = do_stuff_with(request)
    
    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end
  
  def do_stuff_with(request)
    return 200, "text/plain", "you got the page"
  end
  end
  
  def initialize(port_number, page_directory)
    @server = WEBrick::HTTPServer.new(:Port => port_number)
    @server.mount('/helloworld', HelloWorldServlet, page_directory)
    #@server.mount('/edit/', EditWikiPageServlet, page_directory)
    #@server.mount('/', WikiPageServlet, page_directory)
    trap('INT') { stop }
  end
 
  def start
    @server.start
  end
 
  def stop
    @server.shutdown
  end
end


WebServer.new(8080, 'pages').start

