test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require test_lib
include NanoTest
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib pages])) 

require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_store])) 

def new_page
   @page = Page.new("SavedTitle","This is my content")
end


