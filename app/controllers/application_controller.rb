class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    resource.user_type == 'Supplier' ? home_path : food_businesses_path
  end
end
