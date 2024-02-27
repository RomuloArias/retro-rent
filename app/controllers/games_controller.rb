class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def destroy
    @game = Game.find(params[:id])
    @user = Game.where(user: current_user)
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
