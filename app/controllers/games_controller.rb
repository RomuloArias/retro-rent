class GamesController < ApplicationController
  def index
    @games = Game.all
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
    @game = Game.find(params[:id])
    @game.user = current_user
    @game.destroy
    redirect_to user_path(@user), status: :see_other

  end

  def show
    @game = Game.find(params[:id])
  end




  private

  def game_params
    params.require(:game).permit(:name, :console, :genre, :year)
  end








end
