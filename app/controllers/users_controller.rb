class UsersController < ApplicationController

    def index 
        @user = User.all
        render json: {user: @user}
    end
    

end
