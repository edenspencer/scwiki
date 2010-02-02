require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class PageStoreTest < NanoTest::TestCase

  def test_saved_pages_are_readable
    new_page
    begin
      read_page = PageStore.read('SavedTitle')
      assert_equal(@page, read_page, "Pages (Page, Read Page) are not equal") 
    ensure # test file is deleted after test
      File.delete(File.join(File.dirname(__FILE__), %w[.. pages savedtitle]))
    end
  end
end

NanoTest::Runner.run_tests

