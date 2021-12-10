class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params['id'])
    @review = Review.new
    @bookmarks = @list.bookmarks
    @reviews = @list.reviews
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render 'index'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
