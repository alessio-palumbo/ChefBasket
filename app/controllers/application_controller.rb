class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  # private
  
  # def user_not_authorized(exception)
  #   flash[:error] = "You are not allowed to perform this action."
  #     redirect_to(request.referrer || root_path)
  # end

  def after_sign_in_path_for(resource)
    resource.user_type == 'Supplier' ? home_path : food_businesses_path
  end
end
