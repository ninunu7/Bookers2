class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end


  def create

    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render 'books/index'
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render 'books/edit'
    end
  end

  def destroy
     book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def correct_user
    @book = Book.find(params[:id])
    redirect_to(books_path) unless current_user?(@book.user)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def current_user?(user)
    user == current_user
  end

end
