require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => "",
      :project => nil,
      :times_executed => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_filename[name=?]", "task[filename]"

      assert_select "input#task_content_type[name=?]", "task[content_type]"

      assert_select "input#task_file_contents[name=?]", "task[file_contents]"

      assert_select "input#task_project_id[name=?]", "task[project_id]"

      assert_select "input#task_times_executed[name=?]", "task[times_executed]"
    end
  end
end
