Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: :show

  # You can have the root of your site routed with "root"
  root 'home#show'

  match '/:token' => redirect { |params| "/?token=#{params[:token]}" }, defaults: { id: '#{params[:token]}' }, via: :get
end
