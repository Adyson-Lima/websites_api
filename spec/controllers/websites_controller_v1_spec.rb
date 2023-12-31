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

  describe 'GET /api/v1/websites/id' do
    it 'Consegue listar um website especifico e retornar status 200?' do
      get :show, params: {id: @website.id}
      expect(response.body).to include_json(id: @website.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/websites' do
    it 'Consegue criar um website e retornar status 201?' do
      post :create, params: {website: {url: 'workana.com', description: 'site de freelancers'}, format: :json}
      expect(response.body).to include_json(url: 'workana.com')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/websites/id' do
    it 'Consegue atualizar um website e retornar status 200?' do
      website = Website.last
      patch :update, params: {website: {url: 'google.com', description: 'buscador web'}, id: website.id}
      expect(response.body).to include_json(description: 'buscador web')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/websites/id' do
    it 'Consegue excluir um website e retornar status 204?' do
      website = Website.last
      delete :destroy, params: {id: website.id}
      expect(Website.all).not_to include(website)
      expect(response).to have_http_status(204)
    end
  end

end