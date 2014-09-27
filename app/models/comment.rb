class Comment < ActiveRecord::Base

  validates :user_id, presence: true
  validates :link_id, presence: true

  belongs_to :user
  belongs_to :link
  belongs_to :commentable, :polymorphic => true 
  has_many :comments, :as => :commentable 
end
