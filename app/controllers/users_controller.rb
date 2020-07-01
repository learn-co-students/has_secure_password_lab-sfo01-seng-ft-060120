class UsersController < ApplicationController

    before_action :require_logged_in, only: [:home]

    def new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save  
            session[:user_id] = @user.id
            redirect_to controller: 'users', action: 'home'
        else
            return redirect_to controller: 'users', action: 'new'
        end
    end
  
    def home
    end
     
      private
     
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
