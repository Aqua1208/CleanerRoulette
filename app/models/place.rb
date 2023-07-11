class Place < ApplicationRecord
  def show
    @user = User.all
  end  
end
