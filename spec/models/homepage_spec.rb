require 'rails_helper'

RSpec.describe Homepage, type: :model do
  it { is_expected.to respond_to(:contact_us_text) }
  it { is_expected.to respond_to(:footer_links) }

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(Homepage.info_text_for_thumbnail).to eql "Home page."
    end
  end
end
