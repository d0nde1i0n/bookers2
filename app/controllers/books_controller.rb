class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book),notice: "You have created book successfully"
    else
      render :index
    end
  end

  def show
    @book_detail = Book.find(params[:id])
    @book = Book.new
    @user = @book_detail.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     redirect_to book_path(@book),notice: "You have updated user successfully"
   else
     render :edit
   end
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
