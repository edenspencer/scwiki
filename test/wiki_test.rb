test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require 'open-uri'
require test_lib
include NanoTest
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. wiki]))

def test_wiki_blank_state_is_accessible_from_the_web
  page = open('http://wiki.local/wiki.rb/show/index')
  assert_match(/Action = Show, Page = index/, page.string)
end

NanoTest::Runner.run_tests