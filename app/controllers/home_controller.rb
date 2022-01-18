class HomeController < ApplicationController
  def top
    @posts = Post.all

    agent = Mechanize.new
    page = agent.get("https://freesworder.net")
    @elements = page.search('.entry-title')
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
    agent = Mechanize.new
    page = agent.get("http://www.coop.kyushu-u.ac.jp/teishoku220117.html")
    @elements = page.search('.menu')
  end

  def shop
  end

end
