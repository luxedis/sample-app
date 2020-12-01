class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase) # emailでユーザーを取得、sessionはtop.html.erbで使用している。
    if user && user.authenticate(params[:session][:password]) # passwordでさらにユーザーを取得
      log_in user # sessions_helperの3行目の処理
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "ログインしました。" # ログイン時のフラッシューメッセージ 
      redirect_to user # user_url(user)
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
