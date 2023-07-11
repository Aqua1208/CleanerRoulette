class PlacesController < ApplicationController
  def show
    @users = User.all
  end
end
