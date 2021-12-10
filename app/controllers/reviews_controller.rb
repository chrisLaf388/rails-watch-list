class ReviewsController < ApplicationController
  def create
    @list = List.find(params['list_id'])
    @review = Review.new(review_params)
    @review.list_id = params['list_id'].to_i

    if @review.save
      redirect_to list_path(@list)
    else
      render :template => ‘lists/show’, :locals => { @list => @list }
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
