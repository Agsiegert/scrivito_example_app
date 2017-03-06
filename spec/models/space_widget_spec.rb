require 'rails_helper'

RSpec.describe SpaceWidget, type: :model do
  it { is_expected.to respond_to(:size) }

  describe "self.info_text_for_thumbnail" do
    it "returns description text" do
      expect(SpaceWidget.info_text_for_thumbnail).to eql "Creates a vertical space."
    end
  end
end
