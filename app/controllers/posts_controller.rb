class PostsController < ApplicationController
  #this method comes from app controller
  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]
  #or:
  #before_filter :require_user, except: [:index, :show]
  before_filter :find_post, only: [:edit, :update, :destroy]


  def index
    if params[:tag].present?
      #get post filtered by tag
      @featured = Post.featured.tagged_with(params[:tags])
      @posts = Post.tagged_with(params[:tag])
    else
      @featured = Post.featured
      @posts = Post.not_featured
    end

    @tags = Post.tag_counts.order("count desc").limit(8)

  end

  def show
    @post = Post.find_by_url(params[:id])
  end

  def new
    #create form for current user to add post
    @post = current_user.posts.new
    
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      flash[:alert]= "good job! post added"
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def edit

  end


  def update
    if @post.update_attributes(params[:post])
      flash[:alert] = "post edited successfully."
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = "post destroyed"
    redirect_to root_path
  end

  def find_post
    @post= current_user.posts.find_by_url(params[:id])
    rescue
      flash[:error] = "no posts for you to mess with."
      redirect_to root_path
  end

end
