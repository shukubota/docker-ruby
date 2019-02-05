class TweetsController < ApplicationController
  before_action :twitter_client, only: [:get_tweets]
  def index
    @tweets = Tweet.all
    @content_type = true
    if params[:tweet_screen] == "false"
      @content_type = false
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
        Tweet.create(content: tweet.text, html_content: oembed, user_id: User.all[0].id, tweet_api_id: tweet.id)
      end
    end
    #redirect_to :controller => "tweets", :action => "index"
    redirect_to :back
  end

  private
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key = "l8PpXIJtZrHTVCR3B4WERlg8f"
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = "0vbQ0LvNcqd8i6oHW8SUhaPtSVPVh5VRzz4heCaLHbO6GP3Avc"
      config.access_token = "991538627988500480-g1nJz48OFkQ7OmRSkoa0VIyMJLEJSsD"
      config.access_token_secret ="uP9awUtW20raU6yEh3Vq8B3sU1CWw5cKka3WMOEhGWvrt"
    end
  end
end
