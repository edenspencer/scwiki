require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib server]))

class ServerTest < NanoTest::TestCase  

  def setup
    @server = WebServer.new(8080, 'pages')
    print "starting test server"
    Thread.new { @server.start }
  end

  def test_server_responds_to_helloworld
    page = open('http://0.0.0.0:8080/helloworld')
    assert_match(/you got the path \[helloworld\]/, page.string)
  end
  
  def teardown
    @server.stop    
  end
end
