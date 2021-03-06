class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id

    if comment.save
       redirect_to book_path(book)
    else
      @new_book = Book.new
      @book = Book.find(book.id)
      @books = Book.all
      @user = User.find(@book.user.id)
      @book_comment = BookComment.new
      render :'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
