class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  has_many :comments
  
  def to_param
      "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end  

  def approved_comments
    Comment.find(:all, :conditions => { :approved => true, :post_id => id })
  end
end
