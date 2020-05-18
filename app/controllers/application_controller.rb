class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:show]
    
    def after_sign_in_path_for(resource)
        return new_user_path
    end

    # def after_sign_out_path_for(rresources)
    #     return root_path
    # end

end
