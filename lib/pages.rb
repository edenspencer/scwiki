class Page
  attr_accessor :title, :content
  
  def save
    f = File.new("pages/#{@title}", 'w+')
    f.puts @title
    f.close
  end
end

class DefaultPage < Page
  def content
  "<h1>Please create a first page</h1>
   <p><a href='new'>Create a New Page</a></p>"
  end

  def title
    'No pages in the wiki - Why not create one?'
  end
end

class PageNotFound < Page
  def content
  "<h1>This page doesn't exist...</h1>
   <p><a href='new'>why not create it</a></p>"
  end

  def title
    "Page Not Found - Why not create it?" 
  end
end