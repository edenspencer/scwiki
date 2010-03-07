test_lib = File.expand_path(File.join(File.dirname(__FILE__), %w[.. .. .. Craftsmanship NanoTest lib nanotest]))

require test_lib
include NanoTest

require 'open-uri'

#require lib directory
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file }

def new_page
   @page = PageStore.new('test_pages').save(Page.new("SavedTitle","This is my content [http://www.domain.com](MyLink)"))
end

#Make Private Methods Public (For testing) thanks to Jay Fields!
class Class
  def publicize_methods
    saved_private_instance_methods = self.private_instance_methods
    self.class_eval { public *saved_private_instance_methods }
    yield
    self.class_eval { private *saved_private_instance_methods }
  end
end