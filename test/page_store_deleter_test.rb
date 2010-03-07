require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageStoreTest < NanoTest::TestCase
  def test_page_store_deletes_file
    new_page
    PageStore.delete('SavedTitle', 'test_pages')
    assert_false(File.exists?(File.join(%w[.. 'test_pages' 'saved_title'])), "This Page Shouldn't Exist")
  end
  
  def test_page_store_does_not_delete_unsafe_files
     assert_equal(PageStore.delete('unsafe_title', 'unsafe_pages').class.to_s, 'PageNotFound', "Shouldn't delete unsafe files") 
  end
end