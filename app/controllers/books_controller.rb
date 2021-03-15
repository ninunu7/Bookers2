class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update

  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
