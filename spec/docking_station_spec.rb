require "docking_station"

describe DockingStation do
  before :each do
    @docking_station = DockingStation.new
  end

  it "successfully instantiates the DockingStation class" do
    expect(@docking_station).to be_instance_of(DockingStation)
  end

  it { is_expected.to respond_to :release_bike }

  it "releases a working bike" do
    new_bike = Bike.new
    @docking_station.dock_bike(new_bike)
    @docking_station.release_bike(new_bike)
    expect(new_bike).to be_instance_of(Bike)
    expect(new_bike).not_to be_damaged
  end

  it { is_expected.to respond_to :dock_bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "allows a bike to be docked" do
    new_bike = Bike.new
    @docking_station.dock_bike(new_bike)
    expect(@docking_station.bikes).to include(new_bike)
  end

  it "should raise error if the dock is empty" do
    expect { @docking_station.release_bike(Bike.new) }.to raise_error("The dock is empty")
  end

  it "should know when it is empty" do
    expect(@docking_station.bikes.empty?).to eq true
  end

  it "should know when it is not empty" do
    new_bike = Bike.new
    @docking_station.dock_bike(new_bike)
    expect(@docking_station.bikes.empty?).to eq false
  end

  it "has a default capacity of 20" do
    test_capacity = rand(1..100)
    testing_docking_station = DockingStation.new(test_capacity)
    expect(testing_docking_station.capacity).to eq (test_capacity)
  end

  it "only allows up to the default capacity of bikes to be docked if capacity not specified" do
    (@docking_station.capacity).times { @docking_station.bikes << Bike.new }
    expect { @docking_station.dock_bike(Bike.new) }.to raise_error("The dock is full")
  end

  it "should return a list of available undamaged bikes" do
    new_bike = Bike.new
    new_bike2 = Bike.new
    new_bike3 = Bike.new
    new_bike2.damage
    @docking_station.dock_bike(new_bike)
    @docking_station.dock_bike(new_bike2)
    @docking_station.dock_bike(new_bike3)
    expect(@docking_station.select_working_bikes).to include(new_bike, new_bike3)
  end

  it "should return a list of damaged bikes in need of repair" do
    new_bike = Bike.new
    new_bike2 = Bike.new
    new_bike3 = Bike.new
    new_bike2.damage
    new_bike3.damage
    @docking_station.dock_bike(new_bike)
    @docking_station.dock_bike(new_bike2)
    @docking_station.dock_bike(new_bike3)
    expect(@docking_station.select_damaged_bikes).to include(new_bike2, new_bike3)
  end
end
