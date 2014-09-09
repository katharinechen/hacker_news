class LinksController < ApplicationController

  before_filter :authorize, only: [:new, :create, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    render "new"
  end

  def create

  end

  def destroy
  end

end
