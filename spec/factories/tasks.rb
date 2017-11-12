FactoryGirl.define do
  factory :task do
    filename "MyString"
    content_type "MyString"
    file_contents ""
    project nil
    times_executed 1
  end
end
