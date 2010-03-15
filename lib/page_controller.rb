class PageController
  def create(request)
    save_page(request)
    return 200, "text/html", PageRenderer.render(@page), WEBrick::HTTPStatus::SeeOther, "/#{@page.title.to_snake_case}"
  end
  
  def update(request)
    save_page(request)
    return 300, "text/html", PageRenderer.render(@page), WEBrick::HTTPStatus::SeeOther, "/#{@page.title.to_snake_case}"
  end
  
  def save_page(request)
    @page_store = PageStore.new
    @page = (Page.new(request.query['title'],request.query['content']))
    @page_store.save(@page)
  end
   
  def show(page)
    return 200, "text/html", PageRenderer.render(page), false
  end
  
  def edit(page)
    return 200, "text/html", PageRenderer.render(page), false
  end
  
  def delete(page)
    PageStore.delete(page.title)
    return 400, "text/html", PageRenderer.render(PageNotFound.new(page.title))
  end
end