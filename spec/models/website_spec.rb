require 'rails_helper'

RSpec.describe Website, type: :model do

  before{@website = Website.new}

  describe 'Testes de preenchimento dos campos do model Website' do
    
    it 'url consegue ser preenchido?' do
      @website.url = 'olx.com.br'
      expect(@website.url).to eq('olx.com.br')
    end

    it 'description consegue ser preenchido?' do
      @website.description = 'site de vendas'
      expect(@website.description).to eq('site de vendas')
    end

  end

  describe 'Testes de validação dos campos do model Website' do

    it 'objeto website valido com campos obrigatorios preenchidos?' do
      @website.url = 'linkedin.com.br'
      @website.description = 'rede profissional'
      expect(@website).to be_valid
    end

    it 'objeto website invalido com campos obrigatorios não preenchidos?' do
      website = Website.new
      expect(website).to be_valid
    end

  end

end