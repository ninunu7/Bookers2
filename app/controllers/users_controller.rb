class UsersController < ApplicationController

def index
end

def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
end

def create

  @book = Book.new(book_params)
  @book.save
  redirect_to books_path(@book.id)
end


def edit
  @user= User.find(params[:id])
end

def show
  @book = Book.new
  @user = User.find(params[:id])

end


def update
  @user= User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end

def destroy
end

 private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :title, :body)
  end

end
