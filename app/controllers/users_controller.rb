class UsersController < ApplicationController

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

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
