require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib server]))
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_store]))

class StubController  
  def process_request(url)
    return 200, 'text/plain', "HERE> #{url}"
  end
end

class ServerTest < NanoTest::TestCase  

  def setup
    @server = WebServer.new(8080, 'test_pages')
    print "\n-=[ starting test server ]=-\n"
    Thread.new { @server.start }
  end
  
  def test_server_shows_helloworld
    page = open('http://0.0.0.0:8080/helloworld')
    assert_match(/Helloworld/, page.string)
  end
  
  def test_server_routes_depending_on_last_parameter
    page = open('http://0.0.0.0:8080/index/edit')
    assert_match(/Edit/, page.string)
  end
  
  def test_server_will_not_route_to_non_exisitent_actions
    page = open('http://0.0.0.0:8080/index/mouse')
    assert_match(/This page doesn't exist.../, page.string, "should route mouse to show (PageNotFound) as not in routable_actions")
  end
  
  def test_server_connects_delete
    page = open('http://0.0.0.0:8080/index/edit')
    assert_match(/Edit/, page.string, "should match edit")
  end
  
  def test_server_shows_pages_that_exist
    @page = PageStore.new('pages').save(Page.new("SavedTitle","This is my content"))
    page = open('http://0.0.0.0:8080/SavedTitle')
    assert_match(/This is my content/, page.string, "should show an existing page")
  end
  
  def teardown
    print "\n-=[ stopping test server ]=-\n"
    @server.stop    
  end
end
