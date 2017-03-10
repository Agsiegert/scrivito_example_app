
require 'rails_helper'

RSpec.describe CallToActionWidget, type: :model do
  it { is_expected.to respond_to(:action_link) }
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:button_style) }
  it { is_expected.to respond_to(:size) }

  describe :text_extract do
    it "returns the call to action link title" do
      link = Scrivito::Link.new(url: "#", title: "Click here")
      widget = mock_widget(CallToActionWidget, action_link: link)

      expect(widget.text_extract).to eq("Click here")
    end
  end
end
