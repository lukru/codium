class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def profile
    @user = current_user
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:error] = "That user doesn't exits"
      redirect_to '/'
    end
  end
end
