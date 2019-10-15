class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike(bike)
    raise "The dock is empty" if empty?
    @bikes.delete(bike) if bike.damaged? == false
  end

  def dock_bike(bike)
    raise "The dock is full" if full?
    @bikes << bike
  end

  def select_working_bikes
    bikes.reject(&:damaged?)
  end

  def select_damaged_bikes
    bikes.select(&:damaged?)
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
