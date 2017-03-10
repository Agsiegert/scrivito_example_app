require 'rails_helper'

RSpec.describe Image, type: :model do
  it { is_expected.to respond_to(:blob) }
  it { is_expected.to respond_to(:title) }

  describe :apply_image_transformation? do
    it "will not apply transformation when binary type is 'svg'" do
      image = mock_obj(Image, binary_content_type: "svg")

      expect(image.apply_image_transformation?).to be_falsey
    end
    it "will apply when type is not 'svg'" do
      image = mock_obj(Image, binary_content_type: "png")

      expect(image.apply_image_transformation?).to be_truthy
    end
  end
end
