class PostsController < ApplicationController
  require 'yaml'
  
  layout 'home'

  before_filter :authenticate, :except => [:index, :show]

  def new
    @page_title = "New Post"
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = "Successfully saved"
    end

    redirect_to :action => :new
  end

  def show
    @post = Post.find(params[:id])
    redirect_to blog_url unless @post.published
    @page_title = @post.title
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated"
    end
  
    redirect_to :action => :new
  end

  def index
    @page_title = "Andrew P. Brett: Citing the Text"
    @posts = Post.find(:all, :order => "created_at DESC", :conditions => { :published => true } )

    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show_all
    @posts = Post.find(:all, :order => "created_at DESC")
  end

  private

  def authenticate
    config = YAML.load_file("config/passwords.yml")
    authenticate_or_request_with_http_basic do |user, pass|
      user == "andy" && pass == config["posts"]["new"]
    end
  end
end
