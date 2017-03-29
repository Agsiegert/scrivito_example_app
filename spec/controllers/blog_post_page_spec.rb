require 'rails_helper'

RSpec.describe BlogPostPageController, type: :controller do
  let(:obj) { mock_obj(BlogPostPage, published_at: Time.current - 1.year) }
  
  describe 'GET index' do
    it 'renders the blog post page' do
      request.for_scrivito_obj(obj)

      get :index

      expect(response.status).to eq(200)
    end
  end
end
