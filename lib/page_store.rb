require File.expand_path(File.join(File.dirname(__FILE__), 'string_extras'))
include StringExtras

class PageStore
  @@file_path = File.expand_path('pages')
  
  def self.save(page)
    f = File.new(File.join(@@file_path, StringExtras::title_to_snake_case(page.title)), 'w+')
    f.print page.content
    f.close
    page
  end

  def self.read(title)
    f = File.join(@@file_path, StringExtras::snake_case_from_title(title))
    
    if File.exists?(f)
      p = Page.new(title, IO.read(f))
    else
      #Raise An Error Here and Catch it further up?
      PageNotFound.new(title)
    end
  end  
end
