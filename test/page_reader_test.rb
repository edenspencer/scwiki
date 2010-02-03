require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageStoreTest < NanoTest::TestCase
  def test_saved_pages_are_readable
    new_page
    read_page = PageStore.read('SavedTitle')
    assert_equal(@page, read_page, "Pages (Page, Read Page) are not equal") 
  end
  
  def test_file_not_found_triggers_not_found_page
    read_page = PageStore.read('NoSuchFile')
    assert_match(read_page.content, /This page doesn't exist/, "This Page Shouldn't Exist")
  end
  
  def teardown
    file = File.join(File.dirname(__FILE__), %w[.. pages savedtitle])
    File.delete(file) if File.exists?(file)
  end
end

puts "---------------\nPageStore (Reader) Tests\n---------------"
NanoTest::Runner.run_tests

