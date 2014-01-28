class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end
  def new
    @contact = Contact.new
  end

  def create
    @contact =Contact.new(params[:contact])
  end
end