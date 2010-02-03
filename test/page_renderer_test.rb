require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_renderer]))

class PageRendererTest < NanoTest::TestCase
  def test_page_renderer_returns_head_content
    new_page
    ph = PageRenderer.render(@page)
    assert_match(ph, /Content-Type: text\/html\n<html><head><title>SavedTitle<\/title><\/head>/)
  end
  
  def test_page_renderer_returns_body_content
    new_page
    pb = PageRenderer.render(@page)
    assert_match(pb, /<body>This is my content<\/body><\/html>/)
  end
  
  def test_page_renders_edit_content_if_action_is_edit
    new_page
    pe = PageRenderer.render(@page, true)
    assert_match(pe, /<body><form action="edit">This is my content<\/form><\/body><\/html>/, "Should have edit tag")
  end
end

puts "---------------\nPageRenderer Tests\n---------------"
NanoTest::Runner.run_tests
