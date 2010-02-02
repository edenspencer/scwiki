class PageStore
  FILE_PATH = File.expand_path('pages')
  
  def self.save(page)
    f = File.new(File.join(FILE_PATH, title_to_snake_case(page.title)), 'w+')
    f.print page.content
    f.close
    page
  end

  def self.read(title)
    if File.exists?(File.join(FILE_PATH, title_to_snake_case(title)))
      Page.new(title, IO.read(File.join(FILE_PATH, title_to_snake_case(title))))
    else
      PageNotFound.new
    end
  end

  private
  def self.title_to_snake_case(title)
    title.gsub(" ", "_" ).downcase
  end
end
