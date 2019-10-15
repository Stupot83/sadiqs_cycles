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
    @docking_station.release_bike
    expect(new_bike).to be_instance_of(Bike)
    expect(new_bike).to be_working
  end

  it { is_expected.to respond_to :dock_bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "allows a bike to be docked" do
    new_bike = Bike.new
    @docking_station.dock_bike(new_bike)
    expect(@docking_station.bikes).to include(new_bike)
  end

  it "should raise error if the dock is empty" do
    expect { @docking_station.release_bike }.to raise_error("The dock is empty")
  end
end
