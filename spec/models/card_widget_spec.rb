
require 'rails_helper'

RSpec.describe CardWidget, type: :model do
  it { is_expected.to respond_to(:bg_color) }
  it { is_expected.to respond_to(:bg_image) }
  it { is_expected.to respond_to(:color) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:show_heading) }
  it { is_expected.to respond_to(:title) }

  describe :show_heading? do
    it "will not dispaly when set to no" do
      card = CardWidget.new
      allow(card).to receive(:show_heading).and_return("no")
      expect(card.show_heading?).to be_falsey
    end
    it "will display when set to yes (default)" do
      card = CardWidget.new
      allow(card).to receive(:show_heading).and_return("yes")
      expect(card.show_heading?).to be_truthy
    end
  end

  describe :text_extract do
    it "returns the title and text from content widgets" do
      text = "this is the text in the text widget"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(text)
      card = CardWidget.new
      allow(card).to receive(:title).and_return("Card Title")
      allow(card).to receive(:content).and_return([text_widget])

      expect(card.text_extract).to eq(["Card Title", text])
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(CardWidget.info_text_for_thumbnail).to eql "Card with selectable color, background, title bar, tagline, and shadow."
    end
  end
end
