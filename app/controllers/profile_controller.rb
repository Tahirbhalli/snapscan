class ProfileController < ApplicationController
    before_action :check_session
    def index
    end
    private
    def check_session
        redirect_to user_index_path if session[:current_user] == ""
    end
end
