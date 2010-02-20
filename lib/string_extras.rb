module StringExtras
  def self.title_to_snake_case(title)
    title.gsub(" ", "_" ).downcase
  end
  
  def self.snake_case_from_title(title)
    new_title = title.split(/(?=[A-Z])/)
    new_title = new_title.join(" ")
    new_title.gsub(" ", "_" ).downcase
  end
end