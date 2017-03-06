require 'rails_helper'

RSpec.describe NavigationWidget, type: :model do
  it { is_expected.to respond_to(:start_obj) }

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(NavigationWidget.info_text_for_thumbnail).to eql "Display children navigation for hierarchical pages."
    end
  end
end
