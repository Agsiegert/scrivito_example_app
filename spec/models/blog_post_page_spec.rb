require 'rails_helper'

RSpec.describe BlogPostPage, type: :model do
  it { is_expected.to respond_to(:abstract) }
  it { is_expected.to respond_to(:author_email) }
  it { is_expected.to respond_to(:author_name) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to respond_to(:published_at) }

  describe :text_extract do
    it "returns an abstract when one is provided" do
      short_abstract = "this is a short abstract of the blog post"
      blog = mock_obj(BlogPostPage, abstract: short_abstract)

      expect(blog.abstract).to eq(short_abstract)
      expect(blog[:abstract]).to eq(short_abstract)
    end
  end
end
