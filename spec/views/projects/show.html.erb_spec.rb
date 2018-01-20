require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "Name",
      :description => "MyText",
      :wasm_filename => "Wasm Filename",
      :wasm_content_type => "Wasm Content Type",
      :wasm_file_contents => "",
      :js_filename => "Js Filename",
      :js_content_type => "Js Content Type",
      :js_file_contents => ""
    ))
  end

  #it "renders attributes in <p>" do
#    render
#    expect(rendered).to match(/Name/)
#    expect(rendered).to match(/MyText/)
#    expect(rendered).to match(/Wasm Filename/)
#    expect(rendered).to match(/Wasm Content Type/)
#    expect(rendered).to match(//)
#    expect(rendered).to match(/Js Filename/)
#    expect(rendered).to match(/Js Content Type/)
#    expect(rendered).to match(//)
#  end
end
