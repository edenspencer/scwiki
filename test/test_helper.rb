test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require test_lib
include NanoTest

require 'open-uri'

require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_store])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_renderer])) 
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib page_controller]))
require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib server]))

def new_page
   @page = PageStore.save(Page.new("SavedTitle","This is my content"))
end