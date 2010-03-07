require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageRendererTest < NanoTest::TestCase
  def test_page_renderer_returns_head_content
    new_page
    page_header = PageRenderer.render(@page)
    assert_match(/<head>/m, page_header, "should match headers")
  end
  
  def test_page_renderer_returns_body_content
    new_page
    page_body = PageRenderer.render(@page)
    assert_match(/This is my content/, page_body, 'Should Match Content')
  end
  
  def test_page_renders_edit_content_if_action_is_edit
    new_page
    @page.action = :edit
    page_edit = PageRenderer.render(@page)
    assert_match(/<form.*<input.*<\/form>/m, page_edit, "Should have a form tag")
  end
  
  def test_page_renders_links_correctly
    new_page
    @page.action = :show
    page_link = PageRenderer.render(@page)
    assert_match(/<a href='http:\/\/www.domain.com'>MyLink<\/a>/, page_link, 'Should contain a link')
  end
  
  def test_rendering_should_add_edit_link_to_page_if_show
    new_page
    @page.action = :show
    page_edit = PageRenderer.render(@page)
    assert_match(/<a href='\/SavedTitle\/edit'>edit<\/a>/, page_edit, 'Should contain an edit link')
  end
  
  def test_rendering_should_add_delete_link_to_page_if_show
    new_page
    @page.action = :show
    page_delete = PageRenderer.render(@page)    
    assert_match(/<a href='\/SavedTitle\/delete'>delete<\/a>/,page_delete, "Should contain a delete link")
  end
  
  def test_rendering_should_NOT_add_edit_link_to_page_if_edit
    new_page
    @page.action = :edit
    page_edit = PageRenderer.render(@page)
    assert_false(/<a href='\/SavedTitle\/edit'>edit<\/a>/ =~ page_edit, 'Should NOT contain an edit link')
  end
  
  def test_rendering_should_NOT_add_delete_link_to_page_if_edit
    new_page
    @page.action = :edit
    page_delete = PageRenderer.render(@page)    
    assert_false(/<a href='\/SavedTitle\/delete'>delete<\/a>/ =~ page_delete, "Should NOT contain a delete link")
  end
  
  def teardown
    File.delete((File.join(File.dirname(__FILE__), %w[.. test_pages saved_title]))) if File.exists?((File.join(File.dirname(__FILE__), %w[.. test_pages saved_title])))
  end
end