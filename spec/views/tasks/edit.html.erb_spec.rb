require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => "",
      :project => nil,
      :times_executed => 1
    ))
  end

  #it "renders the edit task form" do
#    render

#    assert_select "form[action=?][method=?]", task_path(@task), "post" do

#      assert_select "input#task_filename[name=?]", "task[filename]"

#      assert_select "input#task_content_type[name=?]", "task[content_type]"

#      assert_select "input#task_file_contents[name=?]", "task[file_contents]"

#      assert_select "input#task_project_id[name=?]", "task[project_id]"

#      assert_select "input#task_times_executed[name=?]", "task[times_executed]"
#    end
#  end
end
