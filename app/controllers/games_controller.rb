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
    @game.user = current_user
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

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)

    redirect_to game_path(@game)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :console, :genre, :year, :price_per_day)
  end
end
