class UsersController < ApplicationController
  def show
    @user = user.find(params[id:])
    #@rented_games = @user.rented_games

  end
end
