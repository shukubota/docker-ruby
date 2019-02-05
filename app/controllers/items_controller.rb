class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @flash_message = params[:flash_message]
    @item = Item.find_by(id: params[:id])
    @tweets = Tweet.where(item_id: params[:id])
    @comments = Comment.all
    @content_type = true
    if params[:tweet_screen] == "false"
      @content_type = false
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @save_path = "/items/save/" + @item.id.to_s
  end

  def save
    @item = Item.find_by(id: params[:id])
    @item.update(
      name: params[:item][:name],
      twitter_user_name: params[:item][:twitter_user_name],
      content: params[:item][:content],
      image_path: params[:image]
    )
    redirect_to :controller => "items", :action => "index"
  end

  def create
    image_path = params[:image].empty? ? 'http://ascii.jp/elem/000/001/462/1462295/icon_ogp.jpg' : params[:image]
    @item = Item.create(
      name: params[:name],
      twitter_user_name: params[:twitter],
      content: params[:content],
      image_path: image_path
    )

    redirect_to :controller => "items", :action => "index"
  end

  def delete
    @item = Item.find_by(id: params[:id])
    @item.tweets.each do |tweet|
      tweet.delete
    end
    @item.delete
    redirect_to :controller => "items", :action => "index"
  end

  def sign_in_index
  end

  private
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ""
      config.consumer_secret = ""
      config.access_token = ""
      config.access_token_secret =""
    end
  end
end
