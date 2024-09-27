class HomeController < ApplicationController
    before_action :current_user
    # ツイート内容の表示（全体）
    def index
        @tweet = Tweet.new
        @tweets = Tweet.all.order(created_at: :desc)
    end
    def profile
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

    # ツイート内容を保存
    def create
        tweet = Tweet.new(tweet_params)
        tweet.save
        redirect_to home_index_path
    end

    def destroy
        @tweet_destroy = Tweet.find(params[:id])
        if @tweet_destroy.destroy
          flash[:notice] = "投稿を削除しました"
          redirect_to home_index_path
        else
          flash.now[:alert] = "削除に失敗しました"
          render action: "new"
        end
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
