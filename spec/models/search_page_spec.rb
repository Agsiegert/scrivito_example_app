require 'rails_helper'

RSpec.describe SearchPage, type: :model do
  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(SearchPage.info_text_for_thumbnail).to eql "A search results page."
    end
  end
end
