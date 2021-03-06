test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require test_lib
include NanoTest
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page])) 

class PagesTest < NanoTest::TestCase
 def test_pages_have_a_title
   page= Page.new("My Title", 'My Content')
   assert_equal('My Title', page.title)
 end

 def test_pages_have_content
   page= Page.new("My Title", "My Content")
   assert_equal('My Content', page.content)
 end

 def test_page_equality
   p1 = Page.new("A", "abc")
   p2 = Page.new("B", "xyz")
   p3 = Page.new("A","abc")

   assert_true(p1 == p3, 'pages with the same value are ==')
   #assert_true(p1.eql?(p3))
   #assert_true(p1.hash == p3.hash)
   #assert_true(p1 === p3)
   #assert_true(!p1.equal?(p3))
   #assert_true(p1 != p2)
   #assert_true(!p1.eql?(p2))
   #assert_true(p1.hash != p2.hash)
 end
end
