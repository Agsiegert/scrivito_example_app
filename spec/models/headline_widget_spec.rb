require 'rails_helper'

RSpec.describe HeadlineWidget, type: :model do
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:anchor) }
  it { is_expected.to respond_to(:headline) }
  it { is_expected.to respond_to(:tag) }

  describe :text_extract do
    it "returns the headline" do
      headline = "This is a HEADLINE"
      widget = HeadlineWidget.new
      allow(widget).to receive(:headline).and_return(headline)

      expect(widget.text_extract).to eq(headline)
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(HeadlineWidget.info_text_for_thumbnail).to eql "Display a heading in various sizes and alignments, allows to set an anchor."
    end
  end
end
