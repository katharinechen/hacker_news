class Link < ActiveRecord::Base

  validates :url, presence: true
  validates :user_id, presence: true
  validates :sum_vote, presence: true

  belongs_to :user
  has_many :comments

  def page_title
    mechanize = Mechanize.new
    page = mechanize.get(self.url)
    page.title
  end

end
