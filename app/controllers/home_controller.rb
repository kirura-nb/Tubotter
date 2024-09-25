class HomeController < ApplicationController
    before_action :current_user

    def index
        @tweet = Tweet.new
        @tweets = Tweet.all.order(created_at: :desc)
    end

    # ツイート
    def explore
        @tweet = Tweet.new
    end
    def notifications
        @tweet = Tweet.new
    end
    def messages
        @tweet = Tweet.new
    end
    def profile
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.save
        redirect_to home_index_path
    end

    private

    def current_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to new_sessions_path
        end
    end

    def tweet_params
        params.require(:tweet).permit(:user_name, :user_number, :t_time, :content, :comment, :diffusion, :like)
    end
end
