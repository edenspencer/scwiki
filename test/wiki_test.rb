require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

ENV['PATH_INFO'] = "wiki.rb/show/index"
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. wiki]))

class WikiTest < NanoTest::TestCase
  def test_wiki_blank_state_is_accessible_from_the_web
    page = open('http://wiki.local/show/homepage')
    assert_match(/homepage/, page.string)
  end
  
  def test_wiki_checks_existence_of_file_and_redirects_accordingly
    page = open('http://wiki.local/show/index')
    assert_match(/form/, page.string, "Page Should Contain an Edit form is searched page doesn't exist")
  end
  
  def wiki_passes_params_to_a_controller
      
  end
end
