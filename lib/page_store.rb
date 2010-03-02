require File.expand_path(File.join(File.dirname(__FILE__), 'string_extras'))

class PageStore  
  def initialize(file_path='pages')
    @file_path = File.expand_path(file_path)
  end
  
  def save(page)
    f = File.new(File.join(@file_path, page.title.to_snake_case), 'w+')
    f.print page.content
    f.close
    page
  end

  def read(title)
    f = File.join(@file_path, title.to_snake_case)
    if File.exists?(f)
      Page.new(title, IO.read(f))
    else
      #Raise An Error Here and Catch it further up?
      PageNotFound.new(title)
    end
  end  
end
