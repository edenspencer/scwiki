require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class StubController  
  def process_request(url)
    return 200, 'text/plain', "HERE> #{url}"
  end
end

class PageControllerTest < NanoTest::TestCase
  def setup
    @server = WebServer.new(8080, 'test_pages', StubController)
    print "\n-=[ starting test server ]=-\n"
    Thread.new { @server.start }
  end  
  
  def test_PageController_blank_state_is_accessible_from_the_web
    page = open('http://0.0.0.0:8080/index')
    assert_match(/index/, page.string, "should match index")
  end
  
  def test_server_strips_extra_path_parameters
    PageController.publicize_methods do
      p = PageController.new
      p.page_slug = ['Mickey', 'Mouse', 'Lives', 'in_a_house']
      page = p.concat_extra_path_params
      assert_match(/MickeyMouseLivesIn_a_house/, page, "should match MickeyMouseLives_in_a_house")
    end
  end
  
  def teardown
    @server.stop
    print "\n-=[ stopped test server ]=-\n"
  end
end
