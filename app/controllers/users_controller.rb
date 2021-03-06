class UsersController < ApplicationController
  before_action :authenticate_user!


def index
  @user= current_user
  @users = User.all
  @book = Book.new
end

def edit
  @user= User.find(params[:id])
  if current_user.id != @user.id
    redirect_to user_path(current_user.id)
  end
end

def show
  @user = User.find(params[:id])
  @book_new = Book.new
  @books = @user.books
end


def update
  @user= User.find(params[:id])
  if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
  else
      render 'users/edit'
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
