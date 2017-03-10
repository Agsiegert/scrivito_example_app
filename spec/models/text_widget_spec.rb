require 'rails_helper'

RSpec.describe TextWidget, type: :model do
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:text) }

  describe :text_extract do
    it "returns text" do
      text = "this is a the text"
      text_widget = mock_widget(TextWidget, text: text)

      expect(text_widget.text_extract).to eq(text)
    end

    it "returns stripped text" do
      html_text = "<div>this is the text</div>"
      text_widget = mock_widget(TextWidget, text: html_text)

      text = "this is the text"
      expect(text_widget.text_extract).to eq(text)
    end
  end
end
