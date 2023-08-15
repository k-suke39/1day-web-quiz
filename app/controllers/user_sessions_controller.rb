class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email],params[:password])
    if @user
      redirect_to questions_new_path, notice: t('user_sessions.create.success')
    else
      flash.now[:warning] = t('user_sessions.create.failure')
      render :new,  status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: t('user_sessions.destroy.success')
  end
end
