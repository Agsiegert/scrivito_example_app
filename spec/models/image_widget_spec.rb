require 'rails_helper'

RSpec.describe ImageWidget, type: :model do
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:show_in_lightbox) }

  describe :show_in_lightbox? do
    it "will not display when set to no (default)" do
      widget = mock_widget(ImageWidget, show_in_lightbox: "no")

      expect(widget.show_in_lightbox?).to be_falsey
    end
    it "will display when set to yes" do
      widget = mock_widget(ImageWidget, show_in_lightbox: "yes")

      expect(widget.show_in_lightbox?).to be_truthy
    end
  end
end
