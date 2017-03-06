require 'rails_helper'

RSpec.describe BlogPage, type: :model do
  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(BlogPage.info_text_for_thumbnail).to eql "A blog overview page with a number of blog posts."
    end
  end
end
