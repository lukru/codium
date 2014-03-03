class UsersController < ApplicationController
  skip_before_action :authenticate_user!, except: [:profile]

  before_action :set_user, only: [:show]

  def show
  end

  def profile
    @user = current_user
  end

  private
  def set_user
    @user = User.friendly.find(params[:username])
    unless @user
      flash[:error] = "That user doesn't exits"
      redirect_to '/'
    end
  end
end
