class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_game, only: [:show, :destroy]

  def index
    @games = current_user.games
    @games = Game.all.sort_by(&:updated_at).reverse
    if params[:query].present?
      @games = @games.searching(params[:query])
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      redirect_to games_path, notice: 'Your game was added!'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  def show
    @reviews = @game.reviews
    @review = Review.new
    @booking = Booking.new
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
