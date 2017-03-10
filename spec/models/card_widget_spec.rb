
require 'rails_helper'

RSpec.describe CardWidget, type: :model do
  it { is_expected.to respond_to(:bg_color) }
  it { is_expected.to respond_to(:bg_image) }
  it { is_expected.to respond_to(:color) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:show_heading) }
  it { is_expected.to respond_to(:title) }

  describe :show_heading? do
    it "will not display when set to no" do
      card = mock_widget(CardWidget, show_heading: "no")

      expect(card.show_heading?).to be_falsey
    end
    it "will display when set to yes (default)" do
      card = mock_widget(CardWidget, show_heading: "yes")

      expect(card.show_heading?).to be_truthy
    end
  end

  describe :text_extract do
    it "returns the title and text from content widgets" do
      text = "this is the text in the text widget"
      text_widget = mock_widget(TextWidget, text: text)
      card = mock_widget(CardWidget, title: "Card Title", content: [text_widget])

      expect(card.text_extract).to eq(["Card Title", text])
    end
  end
end
