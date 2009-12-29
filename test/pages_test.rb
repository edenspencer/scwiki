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
end

class WikiTest < NanoTest::TestCase
 def test_wiki_has_a_blank_state
   page = DefaultPage.new
   assert_match(/Please create a first page/, page.content) 
 end

 def test_wiki_blank_state_has_a_title
   page = DefaultPage.new
   assert_equal('No pages in the wiki - Why not create one?', page.title)
 end

 def test_wiki_blank_state_has_a_create_link
   page = DefaultPage.new
   assert_match(/<a href='new'>Create a New Page<\/a>/, page.content, "Default Page Should contain a new link")
 end

 def test_wiki_has_a_not_found_state
   page = PageNotFound.new
   assert_match(/This/, page.content, "Page Not Found should have content")
 end

 def test_wiki_not_found_has_a_titlew
   page = PageNotFound.new
   assert_equal('Page Not Found - Why not create it?', page.title, "Page Not Found should have a pre-set title")
 end
end

NanoTest::Runner.run_tests

