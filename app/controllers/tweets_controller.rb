class TweetsController < ApplicationController
    #require_relative '../../CreateTweet'
    def new
        #@tweet = Tweet.new
    end

    def create
        #@tweet = Tweet.new(tweet_params)
        #@tweet.save
        #redirect_to @tweet
    end

    def show
        #@tweet = Tweet.find(params[:id])
    end

    private
        def tweet_params
            params.require(:tweet).permit(:content)
        end
end
