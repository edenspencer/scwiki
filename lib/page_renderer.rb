class PageRenderer
  def self.render(page, edit_mode=false)
    @page = page
    @edit_mode = edit_mode
    html
  end
  
  private
  def self.html
    "#{head}#{body}#{foot}"
  end
  
  def self.head
    "Content-Type: text/html\n<html><head><title>#{@page.title}</title></head>"
  end
  
  def self.body
    if @edit_mode
      "<body><form action=\"edit\">#{@page.content}</form>"
    else
      "<body>#{@page.content}"
    end
  end
  
  def self.foot
    "</body></html>"
  end
end