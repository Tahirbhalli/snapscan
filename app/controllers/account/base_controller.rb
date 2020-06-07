class Account::BaseController < ApplicationController
    before_action :check_session
    def current_user
        User.find(session[:current_user])
    end
    helper_method :current_user
    private
    def check_session
        redirect_to user_index_path if session[:current_user].nil?
    end
end