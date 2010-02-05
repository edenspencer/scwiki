class Page
  attr_accessor :title, :content

  def initialize(title, content)
    @title, @content = title, content
  end

  def ==(other)
    self.title == other.title && self.content == other.content
  end
  
  def title_to_human(title)
     @title = title.split(/(?=[A-Z])/).join(" ")
   end
end

class PageNotFound < Page
  def initialize(title)
    title_to_human(title)
    @content = "<h1>This page doesn't exist...</h1>\n<form action=\"/new/#{@title}\" method=\"post\"><fieldset>\n<legend>Why Not Create it?</legend>\n<p><label for 'title'>Title</label><br/><input  size='120' type=\"text\" value=\"#{@title}\"></p>\n<p><label for 'content'>Content</label><br/><textarea cols='120' rows='10' type=\"text\" id=\"textarea\"></textarea></p></fieldset><input type=\"submit\"><\/form>"
  end
end

