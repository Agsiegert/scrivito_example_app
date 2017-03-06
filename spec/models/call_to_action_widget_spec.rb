
require 'rails_helper'

RSpec.describe CallToActionWidget, type: :model do
  it { is_expected.to respond_to(:action_link) }
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:button_style) }
  it { is_expected.to respond_to(:size) }

  describe :text_extract do
    it "returns the call to action link title" do
      link = Scrivito::Link.new(url: "#", title: "Click here")
      widget = CallToActionWidget.new
      allow(widget).to receive(:action_link).and_return(link)

      expect(widget.text_extract).to eq("Click here")
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(CallToActionWidget.info_text_for_thumbnail).to eql "Button with various styling options and sizes"
    end
  end
end
