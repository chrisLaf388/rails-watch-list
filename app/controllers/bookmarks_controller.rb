class BookmarksController < ApplicationController
  def new
    @list = List.find(params['list_id'].to_i)
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params['list_id'].to_i)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params['list_id'].to_i
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params['id'].to_i)
    @list = @bookmark.list
    if @bookmark.destroy!
      redirect_to list_path(@list)
    else
      render list_path(@list)
    end
  end
  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
