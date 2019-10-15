class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "The dock is empty" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "The dock is full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
