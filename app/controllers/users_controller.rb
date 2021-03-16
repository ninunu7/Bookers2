class UsersController < ApplicationController

def index
  @user= current_user
  @users = User.all
  @book = Book.new
end

def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
end

def create
  @book = Book.new(book_params)
  @book.save
  if log_in user
    redirect_to books_path(@book.id)
  end
end


def edit
  @user= User.find(params[:id])
end

def show
  @book_new = Book.new
  @book = Book.find(params[:id])
  @user = User.find(params[:id])
end


def update
  @user= User.find(params[:id])
  @user.update(user_params)

  if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
  end
end

def destroy
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

 private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :title, :body)
  end

end
