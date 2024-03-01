class ReviewsController < ApplicationController
  before_action :set_game, only: %i[create]
  def create
    @review = Review.new(review_params)
    @review.game = @game
    @review.user = current_user
      if @review.save
      redirect_to game_path(@game)
      else
        @booking = Booking.new
        render "games/show", status: :unprocessable_entity
      end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
