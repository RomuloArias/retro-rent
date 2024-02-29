class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @games = Game.all
    if params[:query].present?
      @games = @games.searching(params[:query])
    end
  end
end
