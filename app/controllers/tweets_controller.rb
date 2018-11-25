class TweetsController < ApplicationController
  before_action :twitter_client, only: [:get_tweets]
  def index
    @tweets = Tweet.all
    @content_type = false
    if params[:tweet_screen] == "true"
      @content_type = true
    end
  end
  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
    @save_path = "/tweets/save/" + @tweet.id.to_s
  end

  def save
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.update(content: params[:tweet][:content])
    redirect_to :controller => "tweets", :action => "index"
  end

  def create
    #redirect_to :controller => "tweets", :action => "register" if params[:name].empty?
    unless Tweet.create(content: params[:content], user_id: 1)
      error = "もう一度やり直してください"
    end
    redirect_to :controller => "tweets", :action => "index"
  end

  def delete
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.delete
    redirect_to :controller => "tweets", :action => "index"
  end

  def get_tweets
    @client.user_timeline('ScoutalkT',include_rts:false,exclude_replies:true).each do |timeline|
      tweet = @client.status(timeline.id)
      tweet_created = tweet.created_at
      oembed = @client.oembed(tweet.id).html
      unless Tweet.where(tweet_api_id: tweet.id.to_s).count > 0
        Tweet.create(content: tweet.text, html_content: oembed, user_id: 1, tweet_api_id: tweet.id)
      end
    end
    redirect_to :controller => "tweets", :action => "index"
  end

  private
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "HyM0pCYtFbn14zTGCqhPJojpr"
      config.consumer_secret = "oUdIQAfEWRoijoAz3X5QxCpvzzvqriNl4cVxtzaaiMZvoSGVzt"
      config.access_token = "991538627988500480-xnCiknhDgi4BZ71h8kavJaZzY7YzrlD"
      config.access_token_secret ="46tbN9MmC2P9udMW9b7dgQ2OD8WsCYDO6Lstze3Fpi3EQ"
    end
  end
end
