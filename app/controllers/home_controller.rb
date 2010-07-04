class HomeController < ApplicationController
  def index
    @page_title = "Home"
    @posts = Post.find(:all, :order => "created_at DESC", :conditions => { :published => true } )
  end
  
  def bio
    @page_title = "Bio"
  end
  
  def CV
    @page_title = "CV"    
  end
  
  def alter_egos
    @page_title = "Alter Egos"
  end
end
