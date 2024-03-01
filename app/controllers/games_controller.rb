require "open-uri"

class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_game, only: [:show, :destroy]

  def index
    @games = current_user.games.sort_by(&:updated_at).reverse
    if params[:query].present?
      @games = @games.searching(params[:query])
    end
  end

  def new
    @game = Game.new
    @game_name = params.dig(:game_search, :name)
    if @game_name.present?
      response = URI.open("https://www.giantbomb.com/api/search/?api_key=8bf1a4825f3014203e646d9481076557a0352892&format=json&resources=game&query=#{@game_name}").read
      @results = JSON.parse(response, symbolize_names: true)[:results]
      @games = @results
        .filter { |result| result[:platforms]&.map{ |p| p[:name] }&.intersection(Game::CONSOLES)&.any? }
        .map do |result|
        Game.new(
          name: result[:name],
          console: result[:platforms]&.map { |p| p[:name] }.intersection(Game::CONSOLES).first,
          description: result[:image][:description],
          image_url: result[:image][:original_url],
          year: result[:original_release_date].present? ? Date.parse(result[:original_release_date]).year : result[:expected_release_year]
        )
      end
    end
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
