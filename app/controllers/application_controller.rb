class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:home]  

    def after_sign_in_path_for(resource)
        return root_path(current_user.id)
    end

    def after_sign_up_path_for(resource)
        return edit_user_path(current_user.id)
    end

end
