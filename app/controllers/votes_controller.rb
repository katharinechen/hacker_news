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
    if @vote.save
      flash[:notice] = "Thank you for submitting a vote."
      redirect_to root_url
    end
  end

private

  def vote_params
    params.require(:vote).permit(:user_id, :link_id)
  end

end
