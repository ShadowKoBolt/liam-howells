class ContactsController < ApplicationController
  def new
    @contact = ContactRequest.new
  end

  def create
    @contact = ContactRequest.new(contact_request_params)
    if @contact.save
      @contact = ContactRequest.new
      flash.now[:notice] = "Message sent"
      render :new
    else
      render :new
    end
  end

  protected

  def contact_request_params
    params.require(:contact_request).permit(:first_name, :last_name, :email,
                                            :phone, :city, :message)
  end
end
