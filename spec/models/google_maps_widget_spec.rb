require 'rails_helper'

RSpec.describe GoogleMapsWidget, type: :model do
  it { is_expected.to respond_to(:address) }
  it { is_expected.to respond_to(:height) }

  describe :text_extract do
    it "returns the address" do
      address = "Kitzingstr 17"
      map = GoogleMapsWidget.new
      allow(map).to receive(:address).and_return(address)

      expect(map.text_extract).to eq(address)
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(GoogleMapsWidget.info_text_for_thumbnail).to eql "Show a map that displays a pin for a given address."
    end
  end
end
