class Link < ActiveRecord::Base

  validates :url, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, :as => :commentable 
  has_many :votes

  #working code: re-use after Mechanize gem is fixed
  # def page_title
  #   mechanize = Mechanize.new
  #   page = mechanize.get(self.url)
  #   page.title
  # end

  scope :recent, -> { order('created_at DESC') }
  scope :popular, -> { order('sum_vote DESC') }
end
