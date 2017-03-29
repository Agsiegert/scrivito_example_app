require 'rails_helper'

RSpec.describe "SearchPages", type: :request do
  describe "GET /search" do
    it "returns pages with search terms" do
      title = "Widgets are the building blocks of your web page"

      get "/search", params: { q: title }

      expect(response).to have_http_status(200)
      expect(response.body).to include "1 result"
      expect(response.body).to include title

      assert_select "small", "1 result"
      assert_select "h2.panel-title", /"#{title}"/
    end

    it "does not return pages with unfound search terms" do
      unfound_title = "four score and"

      get "/search", params: { q: unfound_title }

      expect(response).to have_http_status(200)
      expect(response.body).to include "No Search Results"
      expect(response.body).to include unfound_title

      assert_select "h2.panel-title", "No Search Results"
    end
  end
end
