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
    expect(new_bike).to be_working
  end
end
