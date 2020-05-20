class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:home]  

    #after user logs in they are redirected to the home page
    def after_sign_in_path_for(resource)
        return root_path(current_user.id)
    end

    #after user signs up they are redirected to complete their profile
    def after_sign_up_path_for(resource)
        return edit_user_path(current_user.id)
    end

end
