class UsersController < ApplicationController
  before_filter :load_territory, only: [:index, :create, :new]
  before_filter :load_user, only: [:update, :edit]

  def index
    @users = @territory.users
  end

  def edit
  end

  def new
    @user = @territory.users.new
  end

  def create
    @user = @territory.users.new(user_params)
    if @user.save
      redirect_to territory_users_path(@territory), notice: "User Created Successfully"
    else
      flash.now[:alert] =  "Unable to update User, Please correct the errors and try again"
      render :new, locals: {territory_id: @territory.id} 
    end
  end

  def update
    if @user.update_attributes(user_params) 
      redirect_to territory_users_path(@user.territory), notice: "User Updated Successfully"
    else
      flash.now[:alert] =  "Unable to update User, Please correct the errors and try again"
      render :edit
    end
  end

  private

  def load_territory
    @territory = Territory.find(params[:territory_id])
  end
  
  def user_params
    params.require(:user).permit(:id, :name, :display_name, :email, :role, :meeting_target, :order_target, :password)
  end

  def load_user 
    @user = User.find(params[:id].to_i)
  end
end
