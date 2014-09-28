require 'rails_helper'

describe Comment do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :link_id }
  it { should belong_to :user }
  it { should belong_to :link }
  it { should have_many :comments }
end
