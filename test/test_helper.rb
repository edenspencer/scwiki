test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require test_lib
include NanoTest

require 'open-uri'

#require lib directory
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file }

def new_page
   @page = PageStore.new('test_pages').save(Page.new("SavedTitle","This is my content"))
end