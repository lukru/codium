class UsersController < ApplicationController
  skip_before_action :authenticate_user!, except: [:profile]

  before_action :set_user, only: [:show]
  before_action :set_current_user, only: [:profile]
  # before_action :set_title, only: [:show, :profile]

  # rescue_from Pundit::NotAuthorizeError, :with => :unauthorized_error

  def new
    @user = User.new
    # authorize @user
  end

  def profile
    render :'users/show'
  end

  def show
  end

  def createstudent

    @user = User.new(user_params)

    # authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }

      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    # authorize @user
  end

  private

  def set_user
    @user = User.friendly.find_by(username: params[:id])
    # binding.pry
    unless @user
      flash[:error] = "That user doesn't exits"
      redirect_to '/'
    end
  end

  def set_current_user
    @user = current_user
  end

  def set_title
    @title = @user.username
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:username,:given_name,:family_name,:tagline,:bio)
  end

  def unauthorized_error
    redirect_to posts_path, :alert => "You can't change this!"
  end
end
