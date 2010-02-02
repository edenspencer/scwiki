require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

ENV['PATH_INFO'] = "wiki.rb/show/index"
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. wiki]))

class WikiTest < NanoTest::TestCase
  def test_wiki_blank_state_is_accessible_from_the_web
    page = open('http://wiki.local/show/index')
    assert_match(/index/, page.string)
  end
end

NanoTest::Runner.run_tests
