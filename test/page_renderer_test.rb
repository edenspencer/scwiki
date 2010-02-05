require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_renderer]))

class PageRendererTest < NanoTest::TestCase
  def test_page_renderer_returns_head_content
    new_page
    page_header = PageRenderer.render(@page)
    assert_match(/Content-Type: text\/html.*<html>.*<head>/m, page_header, "should match headers")
  end
  
  def test_page_renderer_returns_body_content
    new_page
    page_body = PageRenderer.render(@page)
    assert_match(/This is my content/, page_body, 'Should Match Content')
  end
  
  def test_page_renders_edit_content_if_action_is_edit
    @page = PageNotFound.new('TestPage')
    page_edit = PageRenderer.render(@page)
    assert_match(/<form.*<input.*<\/form>/m, page_edit, "Should have a form tag")
  end
  
  def teardown
    File.delete((File.join(File.dirname(__FILE__), %w[.. pages savedtitle]))) if File.exists?((File.join(File.dirname(__FILE__), %w[.. pages savedtitle])))
  end
end