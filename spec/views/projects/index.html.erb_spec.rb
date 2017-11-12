require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :name => "Name",
        :description => "MyText",
        :wasm_filename => "Wasm Filename",
        :wasm_content_type => "Wasm Content Type",
        :wasm_file_contents => "",
        :js_filename => "Js Filename",
        :js_content_type => "Js Content Type",
        :js_file_contents => ""
      ),
      Project.create!(
        :name => "Name",
        :description => "MyText",
        :wasm_filename => "Wasm Filename",
        :wasm_content_type => "Wasm Content Type",
        :wasm_file_contents => "",
        :js_filename => "Js Filename",
        :js_content_type => "Js Content Type",
        :js_file_contents => ""
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Wasm Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Wasm Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Js Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Js Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
