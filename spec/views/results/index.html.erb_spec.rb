require 'rails_helper'

RSpec.describe "results/index", type: :view do
  before(:each) do
    assign(:results, [
      Result.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => "",
        :task => nil
      ),
      Result.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => "",
        :task => nil
      )
    ])
  end

#  it "renders a list of results" do
#    render
#    assert_select "tr>td", :text => "Filename".to_s, :count => 2
#    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => nil.to_s, :count => 2
#  end
end
