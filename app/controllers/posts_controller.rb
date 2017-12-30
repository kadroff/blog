class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post successfully created'}
    #   else
    #     format.html { render :new}
    #     format.json { render json: @post.errors, status: :unprocessable_entity}
    #   end
    # end
    @post.save
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:name, :content, :image)
  end

end
