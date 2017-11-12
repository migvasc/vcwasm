require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :description => "MyText",
      :wasm_filename => "MyString",
      :wasm_content_type => "MyString",
      :wasm_file_contents => "",
      :js_filename => "MyString",
      :js_content_type => "MyString",
      :js_file_contents => ""
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "input#project_wasm_filename[name=?]", "project[wasm_filename]"

      assert_select "input#project_wasm_content_type[name=?]", "project[wasm_content_type]"

      assert_select "input#project_wasm_file_contents[name=?]", "project[wasm_file_contents]"

      assert_select "input#project_js_filename[name=?]", "project[js_filename]"

      assert_select "input#project_js_content_type[name=?]", "project[js_content_type]"

      assert_select "input#project_js_file_contents[name=?]", "project[js_file_contents]"
    end
  end
end
