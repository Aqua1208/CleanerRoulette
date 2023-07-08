class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def create
    cleaners = session[:cleaners]
    cleaners.length.times do |i|
      date = Date.today
      place = Place.find(i+1)
      user = User.find_by(name: cleaners[i])

      log = Log.create(date: date, place_id: place.id, user_id: user.id)
      log.save
    end
  end
end
