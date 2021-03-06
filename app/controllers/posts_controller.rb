class PostsController < ApplicationController
  load_and_authorize_resource

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    post
  end

  def update
    post.update(post_params)

    if post.save
      redirect_to post
    else
      render :edit
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    Post.find(params[:id]).destroy

    redirect_to root_path, notice: "Post deleted successfully"
  end

  def show
    @post = Post.find(params[:id])
    @tag = Tag.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post
    @post ||= Post.find(params[:id])
  end
end
