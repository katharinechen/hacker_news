class LinksController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    render "new"
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
