require 'rails_helper'

RSpec.describe "BlogPage", type: :request do
  describe "GET /blog" do
    before do
      get "/blog"
      @posts = BlogPostPage.all.order(published_at: :desc).to_a
    end
    it "renders the blog overview page" do
      expect(response).to have_http_status(200)

      expect(response.body).to include "Tags"
      expect(response.body).to include "Feed"
      expect(response.body).to include "Photo Stream"
      assert_select "a[href=?]", "/#{@posts[0].title.parameterize}-#{@posts[0].id}"
    end

    it "shows titles of only the last 3 recent posts" do
      assert_select "div.col-md-9" do
        assert_select "div.row", 3 do
          assert_select "h4", @posts[0].title
          assert_select "h4", @posts[1].title
          assert_select "h4", @posts[2].title
        end
      end
    end

    it "does not include titles of more than the last 3 recent posts" do
      assert_select "h4", count: 0, html: @posts[3].title
    end

    it "includes images to the last 5 recent posts in the photo stream" do
      assert_select "div.col-md-3" do
        assert_select "div.panel" do
          assert_select "h2.panel-title", "Photo Stream"
          assert_select "ul.list-inline li a img", 5
          assert_select "a[href=?]", "/#{@posts[0].title.parameterize}-#{@posts[0].id}"
          assert_select "a[href=?]", "/#{@posts[1].title.parameterize}-#{@posts[1].id}"
          assert_select "a[href=?]", "/#{@posts[2].title.parameterize}-#{@posts[2].id}"
          assert_select "a[href=?]", "/#{@posts[3].title.parameterize}-#{@posts[3].id}"
          assert_select "a[href=?]", "/#{@posts[4].title.parameterize}-#{@posts[4].id}"
        end
      end
    end

    it "has pagination" do
      assert_select ".previous", "← Older"
      expect(response.body).to_not include "Newer"
    end
  end
end
