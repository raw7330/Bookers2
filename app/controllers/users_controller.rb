class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,{only: [:edit]}


  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   flash[:notice] = 'update successfully.'

   if @user.update(user_params)
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end
 
 
  def followers
    @user = User.find(params[:id])
    @users = User.all
  end

  def followings
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
