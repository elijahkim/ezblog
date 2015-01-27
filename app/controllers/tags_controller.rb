class TagsController < ApplicationController
  load_and_authorize_resource

  def new
    @post = post
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if tag.save
      post.tags << tag
      redirect_to post
    else
      render :new
    end
  end

  def edit
    @post = post
    @tag = Tag.find(params[:id])
  end

  def update
    tag.update(tag_params)

    if tag.save
      redirect_to post
    else
      render :edit
    end
  end

  def destroy
    if tag.destroy
      redirect_to post
    end
  end

  def index
    @tags = Tag.all
  end

  def show
    tag
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end

  def tag
    @tag ||= Tag.find(params[:id])
  end
end
