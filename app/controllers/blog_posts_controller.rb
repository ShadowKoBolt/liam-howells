# frozen_string_literal: true
class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.order(date: :desc)
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end
end
