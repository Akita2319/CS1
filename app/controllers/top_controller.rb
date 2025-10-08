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
    uid = params[:uid]
    pass = params[:pass]

    if uid == "kindai" && pass == "sanriko"
      session[:login_uid] = uid
      redirect_to action: :main
    else
      render "error", status: 422
    end
  end
end
