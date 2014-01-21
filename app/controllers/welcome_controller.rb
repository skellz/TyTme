class WelcomeController < ApplicationController
  def index
    @charities =Charity.all
  end
end
