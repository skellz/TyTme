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
  end


  def create
    @charity = Charity.new(charity_params)
    @charity.user_id = current_charity.id
    # respond_to do |format|
    #   if @charity.save
    #     format.html { redirect_to charity_path }
    #   else
    #     format.html { render action :new }
    #   end
    # end
  end

  def new
    @charity =Charity.new
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :address, :zip_code, :state, :city, :country)
  end
end
