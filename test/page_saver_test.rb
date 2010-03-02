require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageStoreTest < NanoTest::TestCase

  def setup
    @page = Page.new('SavedTitle', 'This is my content')
    @ps = PageStore.new('test_pages')
    @ps.save(@page)
  end

  def test_pages_with_content_are_saveable
    content = File.read(File.join(File.dirname(__FILE__), %w[.. test_pages saved_title]))
    assert_equal(@page.content, content, "Pages with content are saveable")
  end

  def test_replaces_whitespaces_in_the_filename
    page_with_whitespace_in_title = Page.new('My Title', 'My Content')
    @ps.save(page_with_whitespace_in_title)
    assert_true(File.exists?(File.join(File.dirname(__FILE__), %w[.. test_pages my_title])),  "Whitespace in title is replaced" )
  end
end
