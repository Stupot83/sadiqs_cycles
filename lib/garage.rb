class Garage
  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def fix
    garage_bikes.each do |bike|
      bike.repair
    end
  end

  def unload_damaged_bikes(van)
    van.van_bikes.each do |bike|
      garage_bikes.push(bike)
    end
  end

  def load_repaired_bikes(van)
    garage_bikes.each do |bike|
      if bike.damaged? == false
        van.van_bikes << bike
      end
    end
    garage_bikes.delete_if { |bike| bike.damaged? == false }
  end
end
