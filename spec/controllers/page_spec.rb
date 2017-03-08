require 'rails_helper'

RSpec.describe PageController, type: :controller do
  let(:obj) { mock_obj(Page, path: '/landing_page') }

  before do
    request.for_scrivito_obj(obj)
  end

  describe 'GET index' do
    it 'renders the page' do

      get :index

      expect(response.status).to eq(200)
    end
  end
end