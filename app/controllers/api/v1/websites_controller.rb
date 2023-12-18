class Api::V1::WebsitesController < ApplicationController

  # before_action :set_website, only: %i[] # show update destroy

  def index
    @websites = Website.all 
    render json: @websites
  end

private 

def set_website
  @website = Website.find(params[:id])
end

def website_params
  params.require(:website).permit(:url, :descrition)
end

end