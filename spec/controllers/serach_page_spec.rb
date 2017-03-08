require 'rails_helper'

RSpec.describe SearchPageController, type: :controller do
  describe 'GET index' do
    it 'renders the blog post page' do
      request.for_scrivito_obj
      
      get :index

      expect(response.status).to eq(200)
    end
  end
end
