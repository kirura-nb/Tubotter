class HomeController < ApplicationController
    before_action :current_user

    def index
        @messages = Message.all
    end

    # ツイート
    def message_post
        @message = Message.new
    end

    def create
        message = Message.new(message_params)
        message.save
        redirect_to message_post_path
    end

    private

    def current_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to new_sessions_path
        end
    end

    def message_params
        params.require(:message).permit(:content)
    end
end
