class Router
  attr_accessor :page_content
  ROUTABLE_ACTIONS = [:create, :edit, :delete, :update]
  
  def initialize(request, controller)
    @path = request.path
    @controller = controller
    setup_response
  end
  
  #send to controller
  def setup_response   
    split_path
    set_action
    concat_path
    find_or_create_page
    @controller.send(@action, @page_content)
  end
  
  def split_path
    @page_slug = @path.split("/")
    @page_slug.shift #drops the first blank section
    @page_slug
  end
  
  def set_action    
    if @page_slug[-1] == nil
      potential_action = :show      
      @page_slug = ["index"]
    else
      @potential_action = @page_slug[-1].to_sym      
    end
    
    if @page_slug.size >= 1 && ROUTABLE_ACTIONS.include?(@potential_action)
      @page_slug.pop
      @action = @potential_action
    else      
      @action = :show          
    end
  end
  
  def concat_path
     # you can't just use capitalize, or it wipes out TitleCases
     # so check for TitleCase
     @page = @page_slug.map!{|x| x =~ /[A-Z]/ ? x : x.capitalize! }.join
  end
  
  def find_or_create_page
    @page_content = PageStore.new.read(@page)
    @page_content.action = @action
  end
end
  
