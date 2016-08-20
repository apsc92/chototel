class UsersController < ApplicationController
  before_filter :load_territory, only: :index

  def index
    @users = @territory.users
  end

  private

  def load_territory
    @territory = Territory.find(params[:territory_id])
  end
end
