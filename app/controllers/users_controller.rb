class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_administrator

  def show
    @user = User.find(params[:format])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :description, :first_name, :last_name)
  end
  
private

  def authenticate_user
    unless current_user
      flash[:alert] = "Merci de vous connecter !"
      redirect_to new_user_session_path
    end
  end

  def authenticate_administrator
    unless current_user == User.find(params[:format])
      flash[:alert] = "Vous ne pouvez accéder qu'à votre profil"
      redirect_to root_path
    end
  end
end
# def show
  #   @user = User.find(params[:format]) #peut être qu'il faudra remettre id un jour !!!!!
  # end