class Page
  attr_accessor :title, :content

  def initialize(title, content)
    @title, @content = title, content
  end

  def ==(other)
    self.title == other.title && self.content == other.content
  end
end

class HomePage < Page
  def content
  "<h1>Please create a first page</h1>
   <p><a href='new'>Create a New Page</a></p>"
  end

  def title
    'No pages in the wiki - Why not create one?'
  end
end

class PageNotFound < Page
  def initialize
    @content = "<h1>This page doesn't exist...</h1>
   <p><a href='new'>why not create it</a></p>"
  
    @title = "Page Not Found - Why not create it?" 
  end
end

