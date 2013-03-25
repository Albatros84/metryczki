require 'test_helper'
require 'minitest/reporters'
MiniTest::Reporters.use!

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @user=users(:one)
  end

  def login_as(user)
   @request.cookies[:auth_token] = user ? user.auth_token : nil
end

  test "should get index" do
     login_as(@user)
      get :index
      assert_response :success
      assert_select "title", "Skorowidz"
      assert_select "table tr th","Nazwa"
      assert_select "table"
      assert_template

  end

  test "should get new" do
    login_as(@user)
      get :new
      assert_select "title","Skorowidz"
      assert_response :success

  end

  test "should create project" do
        login_as(@user)
      assert_difference('Project.count') do
        post :create, project: { client: @project.client, highrise: @project.highrise, name: @project.name, project_type: @project.project_type, skydrive: @project.skydrive }
      end
      assert_equal "Project was successfully created.", flash[:notice]
      assert_redirected_to project_path(assigns(:project))
      assert_response :redirect

  end

  test "should show project" do
    login_as(@user)
      get :show, id: @project
      assert_response :success
      assert_select "table.tabl tr td.ins", @project.name
      assert_select "table.tabl tr td.head", "Nazwa projektu:"
      assert_select "table tr td"
      assert_select "form", false, "this page shouldnt contain any forms"
      assert_select "table tr td"
      assert_select "table.tabl", true
      assert_select "td.head", true
      assert_select "td.ins", true
      tables=css_select("table")
      tables.each do |table|
        assert_select "tr"
      end

      trs=css_select("tr")
      trs.each do |tr|
        assert_select "td"
      end


  end

  test "should get edit" do
    login_as(@user)
      get :edit, id: @project
      assert_response :success
      assert_select "form", true

  end

  test "should update project" do
    login_as(@user)
      put :update, id: @project, project: { client: @project.client, highrise: @project.highrise, name: @project.name, project_type: @project.project_type, skydrive: @project.skydrive }
      assert_redirected_to project_path(assigns(:project))
      assert_response :redirect

  end

  test "should destroy project" do
    login_as(@user)
      assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end
    assert_redirected_to projects_path
  end

end
