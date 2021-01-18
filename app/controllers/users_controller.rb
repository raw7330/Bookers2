class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def update
   user = User.find(params[:id])
   user.update(user_params)
   redirect_to user_path
  end

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
