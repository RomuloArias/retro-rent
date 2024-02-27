class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_game, only: [:show, :destroy]

  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to game_path(@game)
  end

  def destroy
    @game.user = current_user
    @game.destroy
    redirect_to user_path(@user), status: :see_other
  end

  def show
    @reviews = @game.reviews
    @review = Review.new
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :console, :genre, :year)
  end
end
