class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    @save_path = "/users/save/" + @user.id.to_s
  end

  def save
    @user = User.find_by(id: params[:id])
    @user.update(name: params[:user][:name])
    redirect_to :controller => "users", :action => "index"
  end

  def create
    #redirect_to :controller => "users", :action => "register" if params[:name].empty?
    unless User.create(name: params[:name])
      error = "もう一度やり直してください"
    end
    redirect_to :controller => "users", :action => "index"
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.delete
    redirect_to :controller => "users", :action => "index"
  end

end
