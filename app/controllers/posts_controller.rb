class PostsController < ApplicationController

  def index
      @posts = Post.all #tried using if @current_user here to hide the posts, but it kept breaking
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
        @post["place_id"] = params["post"]["place_id"]
        @post.save
  else
    flash["notice"] = "Login first."
  end
  redirect_to "/posts"
  end

end
