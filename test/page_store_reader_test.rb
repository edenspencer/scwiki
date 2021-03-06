require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageStoreTest < NanoTest::TestCase
  def test_saved_pages_are_readable
    new_page
    read_page = PageStore.new('test_pages').read('SavedTitle')
    assert_equal("This is my content [http://www.domain.com](MyLink)", read_page.content, "Pages (Page, Read Page) are not equal") 
  end
  
  def test_file_not_found_triggers_not_found_page
    read_page = PageStore.new('test_pages').read('NoSuchFile')
    assert_match(read_page.content, /This page doesn't exist/, "This Page Shouldn't Exist")
  end
  
  def test_camelcased_title_to_human_case
    @page = PageNotFound.new("SavedTitle")
    assert_equal(@page.title, 'Saved Title', 'Test Camelcase to Human')
  end
  
  def teardown
    file = File.join(File.dirname(__FILE__), %w[.. test_pages saved_title])
    File.delete(file) if File.exists?(file)
  end
end

