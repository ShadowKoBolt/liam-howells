# frozen_string_literal: true
class BlogPostsController < ApplicationController
  def index
    redirect_to ENV["MEDIUM_URL"]
  end
end
