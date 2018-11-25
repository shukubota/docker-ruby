class MypagesController < ApplicationController
  def index
    @all_tweets = Tweet.all
  end
end
