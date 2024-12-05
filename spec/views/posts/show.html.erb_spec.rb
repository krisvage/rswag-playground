require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    user = User.create!(email_address: "test@example.com", password: "password")
    assign(:post, Post.create!(
      title: "Title",
      content: "MyText",
      user:
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
