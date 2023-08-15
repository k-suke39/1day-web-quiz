class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to questions_new_path, notice: t('users.create.success')   
    else
      flash.now[:warning] = t('users.create.failure')
      render :new,  status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end



