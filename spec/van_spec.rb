require "van"
require "garage"

describe Van do
  let(:van) { Van.new }
  let(:docking_station) { DockingStation.new }
  let(:garage) { Garage.new }
  arr = [Bike.new, Bike.new]

  it "can successfully instantiate the van class" do
    expect(van).to be_instance_of(Van)
  end

  it "can pick up bikes from a station" do
    arr.each { |bike|
      bike.damage and docking_station.dock_bike(bike)
    }
    van.pick_up_damaged_bikes(docking_station)
    expect(van.van_bikes).to include(arr[0], arr[1])
  end

  it "can pick up bikes from a station" do
    arr[1].repair
    arr.each { |bike|
      docking_station.dock_bike(bike)
    }
    van.pick_up_damaged_bikes(docking_station)
    expect(van.van_bikes).to include(arr[0])
    expect(van.van_bikes).not_to include(arr[1])
  end

  it "can deliver repaired bikes back to a station" do
    arr.each { |bike|
      bike.repair
      van.van_bikes.push(bike)
    }
    van.deliver_repaired_bikes(docking_station)
    expect(docking_station.bikes).to include(arr[0], arr[1])
  end

  it "will only deliver repaired bikes back to a station" do
    arr[1].damage
    arr.each { |bike|
      van.van_bikes.push(bike)
    }
    van.deliver_repaired_bikes(docking_station)
    expect(docking_station.bikes).to include(arr[0])
    expect(docking_station.bikes).not_to include(arr[1])
  end
end
