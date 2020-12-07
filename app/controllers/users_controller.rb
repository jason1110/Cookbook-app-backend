class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login,]
    def index 
        @user = User.all
        render json: {user: @user}
    end
    
    def profile
        render json: @user, status: :accepted
    end

    def create
        @user = User.create(user_params)
        render json: @user, status: :created
    end


    def login
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            @token = JWT.encode({user_id: @user.id}, 'secret')

            render json: {user: @user, token: @token}
        else
            render json: {error: "Inavlid Credentials"}, status: :unauthorized
        end

    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :username,
            :password
        )
    end

end
