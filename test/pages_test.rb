test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require 'open-uri'
require test_lib
include NanoTest
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib pages])) 

class PagesTest < NanoTest::TestCase
 def test_pages_have_a_title
   page= Page.new
   page.title = "My Title"
   assert_equal('My Title', page.title)
 end

 def test_pages_have_content
   page= Page.new
   page.content = "My Content"
   assert_equal('My Content', page.content)
 end
 
 def test_pages_are_saveable
   page = Page.new
   page.title = "SavedTitle"
   page.save
   assert_true(File.open(File.join(File.dirname(__FILE__), %w[.. pages SavedTitle]), 'r'))
 end
 
 def teardown
   #delete the files create by tests
   File.delete(File.join(File.dirname(__FILE__), %w[.. pages SavedTitle]))
 end
end

NanoTest::Runner.run_tests

