class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
    @tweets = Tweet.all
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
    @item.update(name: params[:item][:name])
    redirect_to :controller => "items", :action => "index"
  end

  def create
    #redirect_to :controller => "users", :action => "register" if params[:name].empty?
    @item = Item.create(name: params[:name], company_id: 1)
    if @item
      if params[:file]
        File.binwrite("public/post_images/#{@item.id}.jpg", params[:file].read)
          @item.update(image_path: "#{@item.id}.jpg" )
        else
          @item.update(image_path: "default.jpg" )
        end
    else
      error = "もう一度やり直してください"
    end
    redirect_to :controller => "items", :action => "index"
  end

  def delete
    @item = Item.find_by(id: params[:id])
    @item.delete
    redirect_to :controller => "items", :action => "index"
  end

  def sign_in_index
  
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
