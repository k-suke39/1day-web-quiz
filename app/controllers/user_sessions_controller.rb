class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(email: params[:email], password: params[:password])
    if @user
      redirect_to root_path, notice: t('user_sessions.create.success')
    else
      flash.now[:warning] = t('user_sessions.create.failure')
      render :new,  status: :unprocessable_entity
    end
  end

  def destroy
  end
end
