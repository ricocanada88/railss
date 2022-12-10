class TweetsController < ApplicationController
    before_action :required_user_logged_in!
    before_action :set_tweet, only: [:edit, :update, :show, :destory]
    
    def index
        @tweets = Current.user.tweets
    end

    def new
        @tweets = Tweet.new
    end
    
    def create
        @tweets = Current.user.tweets.new(tweet_params)

        if @tweets.save 
            redirect_to tweets_path,notice: "Tweet was scheduled success"
        else
            render :new 
        end

    end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
            
            redirect_to tweets_path,notice: "Tweet was updated success"
        else
            render :edit
        end
    end

    def destroy
        @tweet.destory
        redirect_to tweets_path,notice: "Tweet was unscheduled"

    end
    
    private
    def tweet_params
        params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)

    end

    def set_tweet
        @tweet = Current.user.tweets.find(prams[:id])
    end
end
