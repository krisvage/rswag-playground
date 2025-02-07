require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/posts").to route_to("posts#index")
    end

    # it "routes to #new" do
    #  expect(get: "/posts/new").to route_to("posts#new")
    # end

    it "routes to #show" do
      expect(get: "/api/v1/posts/1").to route_to("posts#show", id: "1")
    end

    # it "routes to #edit" do
    #   expect(get: "/posts/1/edit").to route_to("posts#edit", id: "1")
    # end


    it "routes to #create" do
      expect(post: "/api/v1/posts").to route_to("posts#create")
    end
  end
end
