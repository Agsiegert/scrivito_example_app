require 'rails_helper'

RSpec.describe "BlogPages", type: :request do
  describe "GET /blog_pages" do
    it "works! (now write some real specs)" do
      # binding.pry
      get "/blog"
      expect(response).to have_http_status(200)
      assert_template("blog_page/index")
      assert_template("blog_page/_post")
      assert_template("blog_page/_tags")
      assert_template("blog_page/_feed")
      assert_template("blog_page/_photo_stream")
    end
  end
end
