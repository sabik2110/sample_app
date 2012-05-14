class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

def authenticate
  deny_access unless signed_in?
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_path) unless current_user?(@user)
end

def admin_user
  redirect_to(root_path) unless current_user.admin?
end

def newcomer
  if current_user.name == "newcomer"
    redirect_to(signup_path)
  end
end

end
