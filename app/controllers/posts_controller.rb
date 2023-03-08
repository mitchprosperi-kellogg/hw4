class PostsController < ApplicationController

  def index
    if @current_user
    @posts = Post.all
    else 
    end
  end
  
  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
      if @current_user
        @post = Post.new
        @post["description"] = params["post"]["description"]
        @post.uploaded_image.attach(params["post"]["uploaded_image"])
        @post["user_id"] = @current_user["id"]
        @post.save
  else
    flash["notice"] = "Login first."
  end
  redirect_to "/places/#{@post["place_id"]}"
  end

end
