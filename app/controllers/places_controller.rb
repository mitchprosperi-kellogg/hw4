class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
    #@post = Post.where({ "user_id" => @user["id"], "user_id" => session["user_id"] }) #tried to use this to only show posts to correct users but it kept breaking
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
  else
    flash["notice"] = "Login first."
  end
    redirect_to "/places"
  end

end
