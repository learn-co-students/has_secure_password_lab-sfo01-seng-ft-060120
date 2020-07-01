class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to welcome_path
        else 
            redirect_to new_user_path
        end
    end

    def show

    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
