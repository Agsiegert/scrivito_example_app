require 'rails_helper'

RSpec.describe "BlogPostPages", type: :request do
  describe "GET /blog_post_pages" do
    it "renders a blog post page" do
      obj = BlogPostPage.where(:title, :equals, "Widgets are the building blocks of your web pages").first
      get "/#{obj.id}"

      expect(response).to have_http_status(200)
      expect(response.body).to include obj.title
      expect(response.body).to include obj.published_at.to_date.to_s
      expect(response.body).to include obj.author_name
      expect(response.body).to include obj.author_email
      expect(response.body).to include obj.tags.first

      assert_select "span", obj.tags.first
      assert_select "h2.panel-title", "Recent Posts"
      assert_select "h2.panel-title", "Tags"
      assert_select "h2.panel-title", "Photo Stream"
    end
  end
end
