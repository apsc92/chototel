class ContactsController < ApplicationController
  before_filter :load_user, only: [:index, :create]
  before_filter :load_contact, only: :update

  def index
    @contacts = @user.contacts
  end

  def edit
    @contact = Contact.find(params[:id].to_i) 
  end

  def new
    @contact = Contact.new(territory_id: params[:territory_id], user_id: params[:user_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = params[:user_id].to_i
    @contact.territory_id = @user.territory.id
    if @contact.save
      redirect_to user_contacts_path(@contact.user.id), notice: "Contact Created Successfully"
    else
      flash.now[:alert] =  "Unable to create contact, Please correct the errors and try again"
      render :new, locals: {user_id: @user.id} 
    end
  end

  def update
    if @contact.update_attributes(contact_params) 
      redirect_to user_contacts_path(@contact.user.id), notice: "Contact Updated Successfully"
    else
      flash.now[:alert] =  "Unable to update contact, Please correct the errors and try again"
      render :edit
    end
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :institute, :category, :meeting_done, :order_booked) 
  end
end
