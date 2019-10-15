require "garage"
require "van"

describe Garage do
  let(:van) { Van.new }
  let(:docking_station) { DockingStation.new }
  let(:garage) { Garage.new }
  arr = [Bike.new, Bike.new]

  it "can successfully instantiate the garage class" do
    expect(garage).to be_instance_of(Garage)
  end

  it "can unload bikes from a van" do
    arr.each { |bike|
      bike.damage and docking_station.dock_bike(bike)
    }
    van.pick_up_damaged_bikes(docking_station)
    garage.unload_damaged_bikes(van)
    expect(garage.garage_bikes).to include(arr[0], arr[1])
  end

  it "the garage can repair bikes that are damaged" do
    arr.each { |bike|
      bike.damage and docking_station.dock_bike(bike)
    }
    van.pick_up_damaged_bikes(docking_station)
    garage.unload_damaged_bikes(van)
    garage.fix
    garage.garage_bikes.each {
      |bike|
      expect(bike.damaged?).to eq false
    }
  end

  it "can load repaired bikes back onto the van" do
    arr.each { |bike|
      garage.garage_bikes.push(bike)
    }
    garage.load_repaired_bikes(van)
    expect(garage.garage_bikes).to be_empty
    expect(van.van_bikes).to include(arr[0], arr[1])
  end
end
