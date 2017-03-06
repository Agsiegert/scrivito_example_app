require 'rails_helper'

RSpec.describe PanelGroupWidget, type: :model do
  it { is_expected.to respond_to(:layout_type) }
  it { is_expected.to respond_to(:panels) }

  describe :text_extract do
    it "returns text from each widget" do
      text = "this is the text in the text widget"
      text_widget = TextWidget.new
      allow(text_widget).to receive(:text).and_return(text)
      widget = PanelWidget.new
      allow(widget).to receive(:content).and_return([text_widget])
      group = PanelGroupWidget.new
      allow(group).to receive(:panels).and_return([widget])

      expect(group.text_extract).to eq([[text]])
    end

    it "returns deliminated text when there are multiple texts" do
      text1 = "this is the text in the first text widget"
      text2 = "two is the text in the second text widget"
      text_widget1, text_widget2 = TextWidget.new, TextWidget.new
      allow(text_widget1).to receive(:text).and_return(text1)
      allow(text_widget2).to receive(:text).and_return(text2)
      widget = PanelWidget.new
      allow(widget).to receive(:content).and_return([text_widget1, text_widget2])
      group = PanelGroupWidget.new
      allow(group).to receive(:panels).and_return([widget])

      expect(group.text_extract).to eq([[text1, text2]])
    end
  end

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(PanelGroupWidget.info_text_for_thumbnail).to eql "Panel Group with several layout options including "\
        "tab group, accordion, and carousel."
    end
  end
end
