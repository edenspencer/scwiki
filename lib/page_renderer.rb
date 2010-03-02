class PageRenderer
  def self.render(page)
    @page = page
    html
  end
  
  private
  def self.html
    "#{head}\n#{body}\n#{foot}"
  end
  
  def self.head
    "<html>\n<head>\n<title>#{@page.title}</title>\n#{styles}\n</head>\n"
  end
  
  def self.styles
    "<style>* {font-family: sans-serif;}</style>"
  end
  
  def self.body
    "<body>\n#{@page.content}\n"
  end
  
  def self.foot
    "<\/body>\n<\/html>"
  end
end