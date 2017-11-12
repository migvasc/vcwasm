require 'rails_helper'

RSpec.describe "results/new", type: :view do
  before(:each) do
    assign(:result, Result.new(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => "",
      :task => nil
    ))
  end

  it "renders new result form" do
    render

    assert_select "form[action=?][method=?]", results_path, "post" do

      assert_select "input#result_filename[name=?]", "result[filename]"

      assert_select "input#result_content_type[name=?]", "result[content_type]"

      assert_select "input#result_file_contents[name=?]", "result[file_contents]"

      assert_select "input#result_task_id[name=?]", "result[task_id]"
    end
  end
end
