require 'rails_helper'

RSpec.describe SearchPageController, type: :controller do
  let(:obj) { mock_obj(SearchPage, path: '/search') }

  before do
    request.for_scrivito_obj(obj)
  end

  describe 'GET index' do
    context 'without search term' do
      it 'renders the Search page' do

        get :index

        expect(response.status).to eq(200)
      end
    end

    context 'with search term' do
      let(:term) { 'example' }

      it 'searches for Search entries' do
        get :index, params: { q: term }
        expect(response.status).to eq(200)
        expect(assigns(:page)).to eq(0)
        expect(assigns(:q)).to eq(term)
        expect(assigns(:tag)).to eq("")
        expect(assigns(:total)).to eq(11)
        expect(assigns(:hits).count).to eq(5)
        expect(assigns(:last_page)).to eq(2)
      end
    end
  end
end
