class Van
  attr_reader :van_bikes

  def initialize
    @van_bikes = []
  end

  def pick_up_damaged_bikes(station)
    station.select_damaged_bikes.each do |bike|
      van_bikes << bike
    end
  end

  def deliver_repaired_bikes(station)
    van_bikes.each do |bike|
      if bike.damaged? == false
        station.bikes << bike
      end
    end
    van_bikes.delete_if { |bike| bike.damaged? == false }
  end
end
