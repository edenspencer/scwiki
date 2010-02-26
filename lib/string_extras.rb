class String
  def to_snake_case
    new_title = self.split(/(?=[A-Z])/).join(" ").gsub(/\s+/, "_" ).downcase
  end
end