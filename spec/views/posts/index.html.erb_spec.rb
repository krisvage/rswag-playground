require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    user = User.create!(email_address: "test@example.com", password: "password")
    assign(:posts, [
      Post.create!(
        title: "Title",
        content: "MyText",
        user:
      ),
      Post.create!(
        title: "Title",
        content: "MyText",
        user:
      )
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
