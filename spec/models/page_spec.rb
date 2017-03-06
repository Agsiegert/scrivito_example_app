require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:child_order) }
  it { is_expected.to respond_to(:display_breadcrumb_and_title) }
  it { is_expected.to respond_to(:tags) }
  it { is_expected.to respond_to(:title) }

  describe :display_breadcrumb_and_title? do
    it "will not dispaly when set to no (default)" do
      page = Page.new
      allow(page).to receive(:display_breadcrumb_and_title).and_return("no")
      expect(page.display_breadcrumb_and_title?).to be_falsey
    end
    it "will display when set to yes" do
      page = Page.new
      allow(page).to receive(:display_breadcrumb_and_title).and_return("yes")
      expect(page.display_breadcrumb_and_title?).to be_truthy
    end
  end

  describe :text_extract do
    it "returns and empty string when there is no text" do
      page = Page.new
      expect(page.text_extract).to eq("")
    end

    it "returns text when there is text" do
      text = "this is the text in the text widget"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(text)
      page = Page.new
      allow(page).to receive(:body).and_return([text_widget])

      expect(page.text_extract).to eq(text)
    end

    it "returns deliminated text when there are multiple texts" do
      text1 = "this is the text in the first text widget"
      text2 = "two is the text in the second text widget"
      text_widget1, text_widget2 = TextWidget.new, TextWidget.new
      allow(text_widget1).to receive(:text).and_return(text1)
      allow(text_widget2).to receive(:text).and_return(text2)
      page = Page.new
      allow(page).to receive(:body).and_return([text_widget1, text_widget2])

      expect(page.text_extract).to eq("#{text1} ... #{text2}")
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(Page.info_text_for_thumbnail).to eql "A regular content page consisting of widgets."
    end
  end
end
