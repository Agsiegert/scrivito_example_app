require 'rails_helper'

RSpec.describe "BlogPostPages", type: :request do
  describe "GET /blog_post_pages" do
    it "works!" do
      obj = BlogPostPage.where(:title, :equals, "Widgets are the building blocks of your web pages").first
      get "/#{obj.id}"
      assert_select "h1", obj.title
      assert_select "span", obj.author_name
      # assert_select "i", obj.published_at
      assert_select "span", obj.author_email

      expect(response).to have_http_status(200)
    end
  end
end
