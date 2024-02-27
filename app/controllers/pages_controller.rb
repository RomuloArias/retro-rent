class PagesController < ApplicationController
  def home
    @pages = Game.all
  end
end
