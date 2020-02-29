class SessionsController < ApplicationController
  def new
  end

  # セッションを生成
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user # ログイン処理
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user  # ユーザページへリダイレクト
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  # セッションを破棄する
  def destroy
    log_out if logged_in? # ログインしていれば，log_outを呼び出す
    redirect_to root_url
  end
end
