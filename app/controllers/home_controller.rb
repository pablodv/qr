class HomeController < ApplicationController
  def show
    if params[:token].present?
      if user = User.by_code(params[:token]).first
        redirect_to user_path(user)
      else
        redirect_to new_user_registration_path(token: params[:token])
      end
    end
  end
end
