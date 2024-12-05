require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:post) {
    user = User.create!(email_address: "test@example.com", password: "password")
    Post.create!(
      title: "MyString",
      content: "MyText",
      user:
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
