require 'rails_helper'

RSpec.describe "BlogPage", type: :request do
  describe "GET /blog" do
    it "renders the blog" do
      # see https://scrivito.com/sdk-cheat-sheet
      posts = BlogPostPage.all.order(published_at: :desc).to_a

      get "/blog"

      expect(response).to have_http_status(200)

      expect(response.body).to include "Tags"
      expect(response.body).to include "Feed"
      expect(response.body).to include "Photo Stream"

      # the controller limits the page to the last 3 recent posts
      assert_select "h4", posts[0].title
      assert_select "h4", posts[1].title
      assert_select "h4", posts[2].title
      # check an element does not exist past our set limit.
      assert_select "h4", count: 0, html: posts[3].title
      # the photo stream includes links to the last 5 recent posts.
      expect(response.body).to_not include posts[5].title
      # Older only shows if there are more than 3 posts
      assert_select ".previous", "← Older"
      expect(response.body).to_not include "Newer"
    end
  end
end
