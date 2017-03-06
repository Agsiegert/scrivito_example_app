require 'rails_helper'

RSpec.describe ImageWidget, type: :model do
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:show_in_lightbox) }

  describe :show_in_lightbox? do
    it "will not dispaly when set to no (default)" do
      widget = ImageWidget.new
      allow(widget).to receive(:show_in_lightbox).and_return("no")
      expect(widget.show_in_lightbox?).to be_falsey
    end
    it "will display when set to yes" do
      widget = ImageWidget.new
      allow(widget).to receive(:show_in_lightbox).and_return("yes")
      expect(widget.show_in_lightbox?).to be_truthy
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(ImageWidget.info_text_for_thumbnail).to eql "A widget with an image."
    end
  end
end
