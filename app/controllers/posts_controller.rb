class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index, :vote] 

  def index 
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save 
      flash[:notice] = "Your post was saved"
      redirect_to posts_path 
    else  
      render 'new'
    end 
  end

  def edit; end

  def update
    if @post.update(post_params) 
      flash[:notice] = "Your post was updated"
      redirect_to post_path(@post)
    else 
      render 'edit'
    end
  end

  def vote
    vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])  
    if vote.valid? 
      flash[:notice] = "Your votes was counted"
    else  
      flash[:error] = "You can only vote on a post once."
    end 
    redirect_to :back 
  end

  private 

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params 
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end
end
