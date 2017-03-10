require 'rails_helper'

RSpec.describe PanelWidget, type: :model do
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:title) }

  describe :text_extract do
    it "returns text from each widget" do
      text = "this is the text in the text widget"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(text)
      widget = PanelWidget.new
      allow(widget).to receive(:content).and_return([text_widget])

      expect(widget.text_extract).to eq([text])
    end

    it "returns deliminated text when there are multiple texts" do
      text1 = "this is the text in the first text widget"
      text2 = "two is the text in the second text widget"
      text_widget1 = mock_widget(TextWidget, text: text1)
      text_widget2 = mock_widget(TextWidget, text: text2)
      widget = mock_widget(PanelWidget, content: [text_widget1, text_widget2])

      expect(widget.text_extract).to eq([text1, text2])
    end
  end
end
