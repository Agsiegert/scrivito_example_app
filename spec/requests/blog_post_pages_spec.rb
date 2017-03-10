require 'rails_helper'

RSpec.describe "BlogPostPages", type: :request do
  describe "GET /blog_post_pages" do
    it "works! (now write some real specs)" do
      obj = BlogPostPage.where(:title, :equals, "Asset management made easy").first
      get "/#{obj.id}"
      expect(response).to have_http_status(200)
    end
  end
end
