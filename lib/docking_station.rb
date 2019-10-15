class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "The dock is empty" if empty?
    Bike.new
  end

  def dock_bike(bike)
    @bikes << bike
  end

  def empty?
    @bikes.empty?
  end
end
