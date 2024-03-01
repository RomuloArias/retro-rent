class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @games = Game.all.sort_by{ |result| result.updated_at}.reverse
    if params[:query].present?
      @games = @games.searching(params[:query])
    end
  end
end
