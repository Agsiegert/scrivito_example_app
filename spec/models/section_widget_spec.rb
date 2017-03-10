require 'rails_helper'

RSpec.describe SectionWidget, type: :model do
  it { is_expected.to respond_to(:bg_color) }
  it { is_expected.to respond_to(:bg_image) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:padding_size) }

  describe :text_extract do
    it "returns text from each widget" do
      text = "this is the text in the text widget"
      text_widget = mock_widget(TextWidget, text: text)
      widget = mock_widget(SectionWidget, content: [text_widget])

      expect(widget.text_extract).to eq([text])
    end

    it "returns deliminated text when there are multiple texts" do
      text1 = "this is the text in the first text widget"
      text2 = "two is the text in the second text widget"
      text_widget1 = mock_widget(TextWidget, text: text1)
      text_widget2 = mock_widget(TextWidget, text: text2)
      widget = mock_widget(SectionWidget, content: [text_widget1, text_widget2])

      expect(widget.text_extract).to eq([text1, text2])
    end
  end
end
