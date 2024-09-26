class UsersController < ApplicationController

    def new
        @user_new = User.new
    end

    def show

    end

    def edit

    end

    def create
        @user_new = User.new(user_params)

        if @user_new.save
            session[:user_id] = @user_new.id
            flash[:notice] = "アカウントを作成しました。"
            redirect_to home_index_path
        else
            flash.now[:alert] = "アカウント作成に失敗しました。"
            render action: "new"
        end
    end

    def update

    end

    private
    
    def user_params
        params.require(:user).permit(:name, :s_number, :password)
    end
end
