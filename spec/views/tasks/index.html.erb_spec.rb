require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => "",
        :project => nil,
        :times_executed => 2
      ),
      Task.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => "",
        :project => nil,
        :times_executed => 2
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
