class PageController
  ROUTABLE_ACTIONS = [:create, :edit, :delete]
  
  def process_request(request)
     @request = request
     setup_response(request)
  end
  
  def create(request)
    @page_store = PageStore.new
    @page = (Page.new(request.query['title'],request.query['content']))
    @page_store.save(@page)
    return 303, "text/html", PageRenderer.render(@page)
  end
   
  def show(page)
    return 200, "text/html", PageRenderer.render(@page_content)
  end
  
  def edit(page)
    return 200, "text/html", PageRenderer.render(@page_content)
  end
  
  def delete(page)
    return 200, "text/plain", "action: delete"
  end
  
  
  private
  def setup_response(request)
    
    @page = request.path.split("/")
    @page.shift #drops the first blank section
    
    set_action
    concat_extra_path_params
    find_or_create_page
    self.send(@action, @page)
  end
  
  def set_action
    potential_action = @page[-1].to_sym
        
    if @page.size >= 1 && ROUTABLE_ACTIONS.include?(potential_action)
      @page.pop
        @action = potential_action
    else
      @action = :show
    end
  end
  
  def concat_extra_path_params
     # you can't just use capitalize, or it wipes out TitleCases
     # so check for TitleCase
     @page = @page.map!{|x| x =~ /[A-Z]/ ? x : x.capitalize! }.join
  end
  
  def find_or_create_page
    @page_content = PageStore.new.read(@page)
  end
end