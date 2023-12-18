require 'rails_helper'

RSpec.describe Api::V1::WebsitesController, type: :controller do

  before{@website = Website.create(url: 'upwork.com', description: 'site de freelancers')}

  describe 'GET /api/v1/websites' do
    it 'Consegue listar todos os websites e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end