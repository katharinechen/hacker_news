require 'rails_helper'

describe Link do

  it { should validate_presence_of :url }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :sum_vote }
  it { should belong_to :user }
  it { should have_many :comments }

end
