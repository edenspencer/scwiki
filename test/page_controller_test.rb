require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageControllerTest < NanoTest::TestCase
  def setup
    @server = WebServer.new(8080, 'test_pages', PageController)
    print "\n-=[ starting test server ]=-\n"
    Thread.new { @server.start }
  end  
  
  def test_PageController_blank_state_is_accessible_from_the_web
    page = open('http://0.0.0.0:8080/index')
    assert_match(/Index/, page.string, "should match index")
  end
  
  def teardown
    @server.stop
    print "\n-=[ stopped test server ]=-\n"
  end
end
