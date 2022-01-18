class HomeController < ApplicationController
  def top
    @posts = Post.all
  end

  def login
  end

  def new
  end

  def post
    @posts = Post.all
  end

  def bus
  end

  def library
  end

  def cafe
  end

  def shop
  end

end
