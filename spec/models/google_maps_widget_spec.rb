require 'rails_helper'

RSpec.describe GoogleMapsWidget, type: :model do
  it { is_expected.to respond_to(:address) }
  it { is_expected.to respond_to(:height) }

  describe :text_extract do
    it "returns the address" do
      address = "Kitzingstr 17"
      map = mock_widget(GoogleMapsWidget, address: address)

      expect(map.text_extract).to eq(address)
    end
  end
end
