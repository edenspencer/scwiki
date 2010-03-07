class PageController
  attr_accessor :page_slug, :page
  
  ROUTABLE_ACTIONS = [:create, :edit, :delete, :update]
  
  def process_request(request)
     @request = request
     setup_response(request)
  end
  
  def create(request)
    @page_store = PageStore.new
    @page = (Page.new(request.query['title'],request.query['content']))
    @page_store.save(@page)
    return 200, "text/html", PageRenderer.render(@page), WEBrick::HTTPStatus::SeeOther, "/#{@page.title.to_snake_case}"
  end
  
  def update(request)
    @page_store = PageStore.new
    @page = (Page.new(request.query['title'],request.query['content']))
    @page_store.save(@page)
    return 300, "text/html", PageRenderer.render(@page), WEBrick::HTTPStatus::SeeOther, "/#{@page.title.to_snake_case}"
  end
   
  def show(page)
    return 200, "text/html", PageRenderer.render(@page_content), false
  end
  
  def edit(page)
    return 200, "text/html", PageRenderer.render(@page_content), false
  end
  
  def delete(page)
    @page = page
    PageStore.delete(page)
    find_or_create_page
    return 400, "text/html", PageRenderer.render(@page_content)
  end
  
  
  private
  def setup_response(request)
    
    @page_slug = request.path.split("/")
    @page_slug.shift #drops the first blank section
    
    set_action
    concat_extra_path_params
    find_or_create_page
    self.send(@action, @page)
  end
  
  def set_action
    if @page_slug[-1] == nil
      potential_action = :show
      @page_slug = ["index"]
    else
      potential_action = @page_slug[-1].to_sym
    end
        
    if @page_slug.size >= 1 && ROUTABLE_ACTIONS.include?(potential_action)
      @page_slug.pop
      @action = potential_action
    else
      @action = :show
    end
  end
  
  def concat_extra_path_params
     # you can't just use capitalize, or it wipes out TitleCases
     # so check for TitleCase
     @page = @page_slug.map!{|x| x =~ /[A-Z]/ ? x : x.capitalize! }.join
  end
  
  def find_or_create_page
    @page_content = PageStore.new.read(@page)
    @page_content.action = @action
  end
end