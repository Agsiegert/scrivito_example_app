require 'rails_helper'

RSpec.describe Image, type: :model do
  it { is_expected.to respond_to(:blob) }
  it { is_expected.to respond_to(:title) }

  describe :apply_image_transformation? do
    it "will not apply transformation when binary type is 'svg'" do
      image = Image.new
      allow(image).to receive(:binary_content_type).and_return("svg")
      expect(image.apply_image_transformation?).to be_falsey
    end
    it "will apply when type is not 'sng'" do
      image = Image.new
      allow(image).to receive(:binary_content_type).and_return("png")
      expect(image.apply_image_transformation?).to be_truthy
    end
  end
end
