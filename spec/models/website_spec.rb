require 'rails_helper'

RSpec.describe Website, type: :model do

  before{@website = Website.new}

  describe 'Testes de preenchimento dos campos do model Website' do
    
    it 'url consegue ser preenchido?' do
      @website.url = 'olx.com.br'
      expect(@website.url).to eq('olx.com.br')
    end

    it 'description consegue ser preenchido?' do
      @website.description = ''
      expect(@website.description).to eq('site de vendas')
    end

  end

end