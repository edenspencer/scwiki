require File.expand_path(File.join(File.dirname(__FILE__), 'string_extras'))

class PageStore
  @@file_path = File.expand_path('pages')
  
  def self.save(page)
    f = File.new(File.join(@@file_path, page.title.to_snake_case), 'w+')
    f.print page.content
    f.close
    page
  end

  def self.read(title)
    f = File.join(@@file_path, title.to_snake_case)
    if File.exists?(f)
      Page.new(title, IO.read(f))
    else
      #Raise An Error Here and Catch it further up?
      PageNotFound.new(title)
    end
  end  
end
