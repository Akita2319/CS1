Rails.application.routes.draw do
  get "top/main"
  get "top/login"
  root 'top#main'        # アプリ起動時は main アクション
  get 'top/main'         # mainページ
  post 'top/login'       # login処理
end
