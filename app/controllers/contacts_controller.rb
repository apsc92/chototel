class ContactsController < ApplicationController
  before_filter :load_user, only: [:index, :create]
  before_filter :load_contact, only: :update

  def index
    @contacts = @user.contacts.order("meeting_date DESC, meeting_done DESC, name ASC")
  end

  def edit
    @contact = Contact.find(params[:id].to_i) 
  end

  def new
    @contact = Contact.new(user_id: params[:user_id])
  end

  def create
    @contact = @user.contacts.new(contact_params)
    if current_user.is_admin? || @user.id == current_user.id 
      if @contact.save
        redirect_to user_contacts_path(@user), notice: "Contact Created Successfully"
      else
        render :new, locals: {user_id: @user.id} 
      end
    else
      redirect_to user_contacts_path(@user), alert: "You are not authorized to perform this action"
    end
  end

  def update
    if current_user.is_admin? || @contact.user.id == current_user.id 
      if @contact.update_attributes(contact_params) 
        redirect_to user_contacts_path(@contact.user.id), notice: "Contact Updated Successfully"
      else
        render :edit
      end
    else
      redirect_to user_contacts_path(@contact.user), alert: "You are not authorized to perform this action" 
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
    params.require(:contact).permit(:name, :country, :status, :institute, :category, :meeting_done, :order_booked, :meeting_date, :comments) 
  end
end
