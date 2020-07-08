class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  private

  helper_method :blogs
  helper_method :blog

  def blogs
    @blogs ||= Blog.all.order(created_at: :desc)
  end

  def blog
    @blog ||= Blog.find(params[:id])
  end
end
