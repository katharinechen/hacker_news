class LinksController < ApplicationController

  before_filter :authorize, only: [:new, :create, :destroy]

  def index
    @vote = Vote.new
    @links = Link.recent
  end

  def new
    @link = Link.new
    render "new"
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Thank you for submitting a link."
      redirect_to root_url
    end
  end

  def destroy
  end

  def popular
    @vote = Vote.new
    @links = Link.popular #with popular scope  
    render "popular"
  end 

private

  def link_params
    params.require(:link).permit(:url, :user_id, :sum_vote)
  end

end
