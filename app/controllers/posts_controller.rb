class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
    # we set up our post_params to expect a key of :category_ids with a value of an empty array.
    # our params hash will have a key of :categories_attributes nested under :post
    # we set up the :categories_attributes to expect a key of name for a category's name
    

  end
end
