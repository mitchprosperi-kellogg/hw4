class PostsController < ApplicationController

  def index
      @posts = Post.all #tried using if @current_user here with a find.by to hide the posts from non-logged in users, but it kept breaking
  end
  
  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
      if @current_user
        @post = Post.new
        @post["title"] = params["post"]["title"]
        @post["description"] = params["post"]["description"]
        @post.uploaded_image.attach(params["post"]["uploaded_image"])
        @post["posted_on"] = params["post"]["posted_on"]
        @post["user_id"] = @current_user["id"]
        @post["place_id"] = params["post"]["place_id"]
        @post.save
  else
    flash["notice"] = "Login first."
  end
  redirect_to "/posts"
  end

end
