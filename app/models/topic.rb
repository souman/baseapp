class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts, :dependent => :destroy
  attr_accessible :name

  validates_presence_of :user_id, :name
  validates_uniqueness_of :name

  def self.popular_topic
    post = Post.select("topic_id, count(topic_id) as 'topic_count'").group("topic_id").order('topic_count desc').limit(1).to_a.first.try(:topic)
  end

  def can_destroy?(current_user)
    (self.user == current_user)
  end

end
