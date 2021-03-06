class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:edit,:update,:destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
      @blog.image.retrieve_from_cache! params[:cache][:image]
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.image.retrieve_from_cache! params[:cache][:image]
    @blog.user_id = current_user.id
    if @blog.save(blog_params)
      redirect_to blogs_path,notice:"新規投稿しました！"
      @user_email = @blog.user.email
      InstaMailer.send_email(@user_email).deliver
    else
      render "new"
    end
  end

  def show
    @user_name = @blog.user.name
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end


  private
  def blog_params
    params.require(:blog).permit(:image,:content,:image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
