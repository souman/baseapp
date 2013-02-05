class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments, :dependent => :destroy
  attr_accessible :content, :title, :post_id

  validates_presence_of :user_id, :topic_id, :content, :title

  def self.popular_post
    post = Comment.select("post_id, count(post_id) as 'post_count'").group("post_id").order('post_count desc').limit(1).to_a.first.try(:post)
  end

  def can_destroy?(current_user)
    (self.user == current_user || self.topic.user == current_user)
  end

end
