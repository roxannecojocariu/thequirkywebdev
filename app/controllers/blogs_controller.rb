class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_url, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @blog ||= Blog.find(params[:id])
  end

  def edit
    @blog ||= Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end
end
