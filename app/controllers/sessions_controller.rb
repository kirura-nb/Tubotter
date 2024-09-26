class SessionsController < ApplicationController
    before_action :logged_in?, only: [:new, :create]

    def new

    end

    def create
        @user = User.find_by(s_number: params[:s_number], password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインに成功しました。"
            redirect_to home_index_path
        else
            flash.now[:alert] = "パスワードが間違っているか、存在しないユーザーです"
            render action: "new"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました。"
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
