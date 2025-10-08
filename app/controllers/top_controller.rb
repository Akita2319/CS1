class TopController < ApplicationController
  # mainアクション
  def main
    if session[:login_uid].present?
      render :main       # ログイン中なら main.html.erb
    else
      render :login      # 未ログインなら login.html.erb
    end
  end

  # loginアクション
  def login
    user = User.find_by(uid: params[:uid])

    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = user.uid
      redirect_to action: :main
    else
      render "error", status: 422
    end
  end

  # logoutアクション
  def logout
    session.delete(:login_uid)
    redirect_to top_login_path, notice: "ログアウトしました"
  end
end
