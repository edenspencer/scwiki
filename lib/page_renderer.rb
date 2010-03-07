class PageRenderer
  def self.render(page)
    @page = page
    pre_process
    html
  end
  
  private
  def self.pre_process
    case @page.action
    when :show
      pre_process_show
    when :edit
      pre_process_edit
    end
  end
  
  def self.pre_process_show
    @page.content = @page.content.gsub(/\[(.+?)\]\((.+?)\)/, "<a href='\\1'>\\2</a>")
  end
  def self.pre_process_edit
    pc = @page.content.gsub(/<a href="([^"]+)">([^<]+)<\/a>/,"[\\2](\\1)")
    pc.gsub!(/\n\n<div class='actions'>.*/, "")
    @page.content = "<form action=\"update\" method=\"post\"><fieldset>\n<legend>Edit: #{@page.title}</legend>\n<p><label for 'title'>Title</label><br/><input  size='120' type=\"text\" value=\"#{@page.title}\" name=\"title\"></p>\n<p><label for 'content'>Content</label><br/><textarea cols='120' rows='10' type=\"text\" id=\"textarea\"  name=\"content\">#{pc}</textarea></p></fieldset><input type=\"submit\"><\/form>"
  end
    
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
    "<body>\n<div class='content'>#{@page.content}</div>\n"
  end
  
  def self.foot
    "<\/body>\n<\/html>"
  end
end