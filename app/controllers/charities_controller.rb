require 'pry'
class CharitiesController < ApplicationController
  def index
    # if charity_signed_in?
    #   charity_root_path
    # else
    #   @charities = Charity.all
    # end
    @charities = Charity.all
  end
  
  def show
    @charity = Charity.find(params[:id])
    # binding.pry
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :address, :zip_code, :state, :city, :country, :id)
  end
end
