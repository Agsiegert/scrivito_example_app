require 'rails_helper'

RSpec.describe TextWidget, :type => :model do
  it { is_expected.to respond_to(:alignment ) }
  it { is_expected.to respond_to(:text) }

  describe :text_extract do
    it "returns text" do
      text = "this is a the text"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(text)

      expect(text_widget.text_extract).to eq(text)
    end

    it "returns stripped text" do
      html_text = "<div>this is a the text</div>"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(html_text)

      text = "this is a the text"
      
      expect(text_widget.text_extract).to eq(text)
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(TextWidget.info_text_for_thumbnail).to eql "Display text and HTML content."
    end
  end
end
