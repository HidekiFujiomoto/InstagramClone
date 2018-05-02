class SessionsController < ApplicationController
  def create
    # パスワードとメールアドレスの組み合わせが有効かどうか判定
    user = User.find_by(email: params[:session][:email].downcase)

    # パスワードが一致しているかを確認
    if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      # ログイン失敗した場合
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end
end
