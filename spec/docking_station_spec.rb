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
    new_bike = @docking_station.release_bike
    expect(new_bike).to be_instance_of(Bike)
    expect(new_bike).to be_working
  end

  it { is_expected.to respond_to :dock_bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "allows a bike to be docked" do
    bike1 = Bike.new
    @docking_station.dock_bike(bike1)
    expect(@docking_station.bikes).to include(bike1)
  end
end
