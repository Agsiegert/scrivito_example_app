require 'rails_helper'

RSpec.describe HeadlineWidget, type: :model do
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:anchor) }
  it { is_expected.to respond_to(:headline) }
  it { is_expected.to respond_to(:tag) }

  describe :text_extract do
    it "returns the headline" do
      headline = "This is a HEADLINE"
      widget = mock_widget(HeadlineWidget, headline: headline)

      expect(widget.text_extract).to eq(headline)
    end
  end
end
