require File.expand_path(File.join(File.dirname(__FILE__), %w[test_helper])) 

class StubController
  def show(page)
    return true
  end
  
  def edit(page)
    return true
  end
  
  def create(page)
    return true
  end
  
  def update(page)
    return true
  end
  
  def delete(page)
    return true
  end
end

class RouterTest < NanoTest::TestCase
  Request = Struct.new(:path)
  
  def setup
    @controller = StubController.new
    @request = Request.new
  end
  
  def test_router_splits_path_and_removes_first_blank    
    @request.path = "/a/path/here"
    r = Router.new(@request, @controller)
    split_path = r.split_path
    assert_equal(split_path, ['a', 'path', 'here'], "should split paths and remove blank first part")
  end
  
  def test_router_derives_actions_from_last_path_item
    @request.path = "/a/path/edit"
    r = Router.new(@request, @controller) 
    r.split_path
    action = r.set_action
    assert_equal(action, :edit, "should derive edit from url path")
  end
  
  def test_router_only_routes_allowed_actions_delete
    @request.path = "/a/path/delete"
    r = Router.new(@request, @controller)
    r.split_path
    action = r.set_action
    assert_equal(action, :delete, "action should be delete")
  end
  
  def test_router_only_routes_allowed_actions_create
    @request.path = "/a/path/create"
    r = Router.new(@request, @controller)
    r.split_path
    action = r.set_action
    assert_equal(action, :create, "action should be create")
  end
  
  def test_router_only_routes_allowed_actions_update
    @request.path = "/a/path/update"
    r = Router.new(@request, @controller)
    r.split_path
    action = r.set_action
    assert_equal(action, :update, "action should be create")
  end
  
  def test_router_only_routes_allowed_actions
    @request.path = "/a/path/nonaction"
    r = Router.new(@request, @controller)
    r.split_path
    action = r.set_action
    assert_equal(action, :show, "should show as action is not allowed from url path")
  end
  
  def test_router_strips_extra_path_parameters
    @request.path = "/Mickey/Mouse/Lives/In_a_house"
    r = Router.new(@request, @controller)
    r.split_path
    r.set_action
    r.concat_path
    page = r.concat_path
    assert_match(/MickeyMouseLivesIn_a_house/, page, "should match MickeyMouseLives_in_a_house")
  end
end