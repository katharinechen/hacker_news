class Link < ActiveRecord::Base

  validates :url, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments
  has_many :votes

  def page_title
    mechanize = Mechanize.new
    page = mechanize.get(self.url)
    page.title
  end

  default_scope { order('created_at DESC') }

  # scope :popular, ~> { order(".sum_vote DESC") }

end
