class ContactsController < ApplicationController
  before_filter :load_user, only: :index

  def index
    @contacts = @user.contacts
  end


  private

  def load_user
    @user = User.find(params[:user_id])
  end
end
