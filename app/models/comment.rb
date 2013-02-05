class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :content

  validates_presence_of :user_id, :post_id, :content


  def can_destroy?(current_user)
    (self.user == current_user || self.post.user == current_user || self.post.topic.user == current_user)
  end

end
