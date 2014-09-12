class VotesController < ApplicationController

  before_filter :authorize, only: [:new, :create]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if (Vote.where(user_id: current_user.id).take == nil) && (current_user.id != @vote.link.user_id)
      if @vote.save
        flash[:notice] = "Thank you for submitting a vote."
        # @vote.link.update_attribute :sum_vote, Vote.where(link_id = @vote.link_id).length
        redirect_to root_url
      end
    else
      flash[:notice] = "Your vote has not been submitted. Users can only vote once and for links that they did not submit."
      redirect_to root_url
    end
  end

private

  def vote_params
    params.require(:vote).permit(:user_id, :link_id)
  end

end


