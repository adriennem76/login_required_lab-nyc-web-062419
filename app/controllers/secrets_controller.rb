class SecretsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:show]
    def show
        if current_user != nil
            render :secret
        else
            redirect_to "/login"
        end
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
