class PostsController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @posts = @blog.posts
  end

  def new
    @blog = Blog.find(params[:blog_id])  
    @post = @blog.posts.new()
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @blog, url: blog_path(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def post_params
    params[:post]
      .permit(:title, :body)
  end
end