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
    else
      pre_process_show
    end
  end
  
  def self.pre_process_show
    @page.content = @page.content.gsub(/\[(.+?)\]\((.+?)\)/, "<a href='\\1'>\\2</a>")
  end
  
  def self.pre_process_edit
    pc = @page.content.gsub(/<a href="([^"]+)">([^<]+)<\/a>/,"[\\2](\\1)")
    @page.content = "<form action=\"update\" method=\"post\"><fieldset>\n<legend>Edit: #{@page.title}</legend>\n<p><label for 'title'>Title</label><br/><input  size='120' type=\"text\" value=\"#{@page.title}\" name=\"title\"></p>\n<p><label for 'content'>Content</label><br/><textarea cols='120' rows='10' type=\"text\" id=\"textarea\"  name=\"content\">#{pc}</textarea></p></fieldset><input type=\"submit\"><\/form>"
  end
    
  def self.html
    "#{head}\n#{body}\n#{actions}\n#{foot}"
  end
  
  def self.head
    "<html>\n<head>\n<title>#{@page.title}</title>\n#{styles}\n</head>\n"
  end
  
  def self.styles
    "<style>* {font-family: sans-serif;} body {background-color: #DDD;} #scwiki {width: 760px; padding: 0 20px; margin: 0 auto; color: #666;} .content {width: 758px; padding: 0 20px 20px 20px; margin: 10px auto; background-color: white; border:1px solid #BBB;} .actions { width: 758px; padding: 10px 20px; margin: 0 auto; background-color: #DFDFDF; border-bottom:1px solid #BBB;margin-top: 10px} fieldset {border:1px solid #BBB;} </style>"
  end
  
  def self.body
    "<body>\n<div id='scwiki'><h2>SCWiki<h2></div><div class='content'><h1>#{@page.title}</h1>#{@page.content}</div>\n"
  end
  
  def self.actions
    "\n\n<div class='actions'><a href='/#{@page.title}/edit'>edit</a> | <a href='/#{@page.title}/delete'>delete</a></div>" if @page.action == :show && @page.class != PageNotFound
  end
  
  def self.foot
    "<\/body>\n<\/html>"
  end
end