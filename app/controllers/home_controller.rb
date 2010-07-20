class HomeController < ApplicationController
  def index
    @page_title = "Andrew P. Brett"
    @posts = Post.find(:all, :order => "created_at DESC", :conditions => { :published => true } )
  end
  
  def bio
    @page_title = "Andrew P. Brett: Bio"
  end
  
  def CV
    @page_title = "Andrew P. Brett: CV"    
  end
  
  def alter_egos
    @page_title = "Andrew P. Brett: Alter Egos"
  end
end
