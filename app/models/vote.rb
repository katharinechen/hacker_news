class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :link

  # validates_uniqueness of :user_id, scope :post_id

end
