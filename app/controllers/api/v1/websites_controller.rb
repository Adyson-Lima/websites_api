class Api::V1::WebsitesController < ApplicationController

  before_action :set_website, only: %i[show update destroy] # show update destroy

  def index
    @websites = Website.all 
    render json: @websites
  end

  def show
    render json: @website
  end

  def create
    @website = Website.new(website_params)
    if @website.save
      render json: @website, status: :created, location: api_v1_website_url(@website)
    else
      render json: @website.errors, status: :unprocessable_entity
    end
  end

  def update
    if @website.update(website_params)
      render json: @website
    else
      render json: @website.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @website.destroy!
  end

private 

def set_website
  @website = Website.find(params[:id])
end

def website_params
  params.require(:website).permit(:url, :description)
end

end