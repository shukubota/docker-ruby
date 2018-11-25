class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
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
end
