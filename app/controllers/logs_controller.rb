class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def create
    cleaners = User.where.not(place_id: nil).order('place_id').pluck(:name)
    
    cleaners.length.times do |i|
      date = Date.today
      place = Place.find(i+1)
      user = User.find_by(name: cleaners[i])

      log = Log.create(date: date, place_id: place.id, user_id: user.id)
      log.save
      
      count_column = Count.find_by(place_id: place.id, user_id: user.id)
      if count_column
        count = count_column.update(count: Log.where(place_id: place.id, user_id: user.id).count)
      else
        count = Count.create(place_id: place.id, user_id: user.id, count: 1)
        count.save
      end
    end
  end
end
