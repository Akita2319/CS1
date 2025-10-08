Rails.application.routes.draw do
  root 'top#main'          # アプリ起動時は main アクション

  get 'top/main'           # mainページ
  post 'top/login'         # login処理
  post 'top/logout'        # logout処理 ←★これを追加
end
