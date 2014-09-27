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
    if (Vote.where(user_id: current_user.id, link_id: vote_params[:link_id]).take == nil) && (current_user.id != @vote.link.user_id)

      if @vote.save
        flash[:notice] = "Thank you for submitting a vote."
        @link = Link.find(params[:id] = @vote.link_id)
        @link.sum_vote = @link.sum_vote + 1 
        @link.save 
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


