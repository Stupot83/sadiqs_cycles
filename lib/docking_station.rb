class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bikes << bike
  end
end
