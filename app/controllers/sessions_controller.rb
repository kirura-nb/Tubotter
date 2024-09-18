class SessionsController < ApplicationController
    before_action :logged_in?, only: [:new, :create]

    def new

    end

    def create
        @user = User.find_by(s_number: params[:s_number], password: params[:password])
        if @user
            session[:user_id] = @user.id
            redirect_to home_index_path
        else
            render action: "new"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_sessions_path
    end

    private
    def logged_in?
        if session[:user_id]
            @user = User.find(session[:user_id])
            redirect_to home_index_path
        end
    end

end
