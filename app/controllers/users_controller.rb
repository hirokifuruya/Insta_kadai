class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "プロフィールが編集されました"
    else
        render :edit
    end
  end

  def favorite_blog
    @user = User.find(params[:id])
    favorite = Favorite.where(user_id: current_user.id).pluck(:blog_id)
    @favorites = Blog.find(favorite)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
