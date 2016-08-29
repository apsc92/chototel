class UsersController < ApplicationController
  before_filter :load_user, only: [:update, :edit]

  def index
    @users = User.all.where.not(role: 'admin').order(name: :asc)
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if current_user.is_admin?
      if @user.save
        redirect_to root_path, notice: "User Created Successfully"
      else
        render :new 
      end
    else
      redirect_to root_path, alert: "You are not authorized to perform this action"
    end
  end

  def update
    if current_user.is_admin?
      if @user.update_attributes(user_params) 
        redirect_to root_path, notice: "User Updated Successfully"
      else
        render :edit
      end
    else 
      redirect_to root_path, alert: "You are not authorized to perform this action"
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :display_name, :email, :role, :meeting_target, :order_target, :password)
  end

  def load_user 
    @user = User.find(params[:id].to_i)
  end
end
